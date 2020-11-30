package com.cantech.cannect.fragment;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.cantech.cannect.DataParsing;
import com.cantech.cannect.R;
import com.cantech.cannect.SharedPref;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link Actual_Engine_Torque_Fragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class Actual_Engine_Torque_Fragment extends Fragment {

    private static final String TAG = "Actual Torque Fragment";
    TextView actualETorque;
    SharedPref sharedPref;
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

    public interface FromActualTorque{
        void sendActualETorquePID(String string);
    }

    FromActualTorque mCallback;

    public Actual_Engine_Torque_Fragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment Actual_Engine_Torque_Fragment.
     */
    // TODO: Rename and change types and number of parameters
    public static Actual_Engine_Torque_Fragment newInstance(String param1, String param2) {
        Actual_Engine_Torque_Fragment fragment = new Actual_Engine_Torque_Fragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onAttach(@NonNull Context context) {
        super.onAttach(mContext);
        mContext = context;
        if(context instanceof FromActualTorque){
            mCallback = (FromActualTorque) context;
        }else{
            throw new ClassCastException(context.toString() + "must implement sendDemandETorquePID");
        }
        LocalBroadcastManager.getInstance(mContext).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        sharedPref = new SharedPref(mContext);
        //set theme
        if(sharedPref.loadDarkModeState()==true){
            mContext.getTheme().applyStyle(R.style.darkTheme, true);
        }else{

            mContext.getTheme().applyStyle(R.style.AppTheme, true);
        }
        super.onCreate(savedInstanceState);
        data_message = new StringBuilder();
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_actual_engine_torque, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
       actualETorque = view.findViewById(R.id.actualETorque_TextView);

    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
    }

    @Override
    public void onResume() {
        LocalBroadcastManager.getInstance(mContext).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
        super.onResume();
    }

    @Override
    public void onPause() {
        LocalBroadcastManager.getInstance(mContext).unregisterReceiver(mReceiver);
        super.onPause();
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mContext = null;
        mCallback = null;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
    }

    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String text = intent.getStringExtra("theMessage");
            Log.d(TAG, text);
            data_message.append(text + "\n");
            String[] parsed = dataParsing.convertOBD2FrameToUserFormat(data_message.toString());
            try {
                switch (parsed[0]) {
                    case "ACTUAL ENGINE TORQUE":
                        //changing string to float.
                        actualETorque.setText(parsed[1]);
                        break;
                    default:
                        mCallback.sendActualETorquePID("62");
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
}