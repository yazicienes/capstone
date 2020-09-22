package com.cantech.cannect.fragment;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Color;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.cantech.cannect.DataParsing;
import com.cantech.cannect.R;
import com.github.anastr.speedviewlib.Speedometer;
import com.github.anastr.speedviewlib.components.Section;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link Speedgauge_fragment#newInstance} factory method to
 * create an instance of this fragment.
 */

public class Speedgauge_fragment extends Fragment {


    private static final String TAG = "Speedgauge fragment";
    Speedometer carSpeed;
    private Context mContext;
    private DataParsing dataParsing;
    private StringBuilder data_message;

    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

    public Speedgauge_fragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment Speedgauge_fragment.
     */
    // TODO: Rename and change types and number of parameters
    public static Speedgauge_fragment newInstance(String param1, String param2) {
        Speedgauge_fragment fragment = new Speedgauge_fragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        Log.d(TAG, "onCreate started");
        data_message = new StringBuilder();
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }


    }
    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            //needs to be modified, received value is a string. also add multiple datasets
            String text = intent.getStringExtra("theMessage");
            Log.d(TAG, text);
            data_message.append(text + "\n");
            String[] parsed = dataParsing.convertOBD2FrameToUserFormat(data_message.toString());
            try {
                switch (parsed[0]) {
                    case "VEHICLE SPEED":
                        //changing string to float.
                           carSpeed.speedTo(Float.parseFloat(parsed[1]));
                        break;

                    default:
                        break;
                }
            }catch (Exception e){
                e.printStackTrace();
            }

            if (data_message.length()>=32){
                data_message.setLength(0);
            }
        }
    };


    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        mContext = context;
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mContext = null;
    }
    @Override
    public void onPause() {
        LocalBroadcastManager.getInstance(mContext).unregisterReceiver(mReceiver);
        super.onPause();
    }

    @Override
    public void onResume() {
        LocalBroadcastManager.getInstance(mContext).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
        super.onResume();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        Log.d(TAG, "onCreateView started");
        LocalBroadcastManager.getInstance(mContext).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
        // Inflate the layout for this fragment
        View layout = inflater.inflate(R.layout.fragment_speedgauge, container, false);
        return inflater.inflate(R.layout.fragment_speedgauge, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        carSpeed = (Speedometer) view.findViewById(R.id.speedView);
        carSpeed.clearSections();
        carSpeed.addSections(
                new Section(0f, .65f, Color.BLACK)
                , new Section(.65f, .85f, Color.YELLOW)
                , new Section(.85f, 1f, Color.RED));
        carSpeed.setSpeedometerWidth(30);


    }
//    @Override
//    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
//        MenuItem item;
//        int i = 0;
//        for(; i < menu.size(); i++){
//            item = menu.getItem(i);
//            if(item.toString() == "Speed")
//                break;
//        }
//        menu.removeItem(i);
//        inflater.inflate(R.menu.option_for_container2, menu);
//        super.onCreateOptionsMenu(menu, inflater);
//    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
    }
}