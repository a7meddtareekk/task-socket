import 'package:flutter/material.dart';

import 'chatHistory.dart';
import 'data.dart';

class AllChats extends StatelessWidget {
  const AllChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        UserId = '99';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatHistory(
                                      token:
                                          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTAwZTdjMmUzNmNlZGE5ZjUxNDkxMzQyZTliNjY4NzBmMDY0NDY4YmU0Mzk2ZTIzOGI0ZTQ1ZWVmMjg3NWM0N2VhZmM5OTdjNTFhYjFmYzgiLCJpYXQiOjE2NzU5NTkyMzEuODM5MDQ0LCJuYmYiOjE2NzU5NTkyMzEuODM5MDQ4LCJleHAiOjE3MDc0OTUyMzEuODI1NzAzLCJzdWIiOiI5OSIsInNjb3BlcyI6W119.TB409Mp3UcIcQFhIU9G3pi_EP9XL0163bJNTF2PM48Tx20iBDROaOdM5nZa5r-Xfbsgc8ZhlFpPIpJFuUkxkyEE2DWthEcCES82ZNbsbsgypsn63aPeZdYS81Y1VmNhKJH0fWB5ihvVbv-LCNGmrxRiL9k-XuN_b4KZv0Pl7fSl9v3Be0eqmn2ybsu_W4TEel7SJ9sxBIDTcVru_Kh1USa2ES5kCD_OP23TYH6-o1Opuogo12VcEmtudHywkVQfwcXQ485NRIha_piYrvpwSwQ6MXYAz1y3S4EhQ7s8CoCsn-_g37ECPjkZOFVS_DkEc3YJFaYll2651-t_cSZBPqfVqrWqPLBODTCwH-IKf3ELz1xRMnhgqPV49_lvNfsmIMVhCPTUtOzIecqvttFinC3zg6BKmYG1WA-cYkuodjRamaNPByveg8yBdus1uE17s78AtjVw6sTzZt-2akCjnQY_xpZAxFkBXTne6mm2Hc1jKYD-M8WiKZIMGRTh8HVLUXKh5zZmdErPZbkmczyJUZK1-gNwXVWEVq8ReLle25avwQASEf4QHL2TOr9CgJGXY9TcA96L4l7SDGhlAFUyFl6YTuLaY90u3e-XkQDXVwEfJgHp-SZKfdfDXEXoD3yye2yy0W1URJ8MbdKQe5fJdzDAmn9QGngEbxjcujiBxvM8',
                                      senderId: '99', title: 'Iam Tarek and Chat with mohamed',
                                    )));
                      },
                      child: Column(
                        children: const [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue,
                            child: Text("M"),
                          ),
                          Text("Iam Tarek Click to Chat with Mohamed",textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        UserId = '98';

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatHistory(
                                  title: "Iam Mohamed and Chat with tarek",
                                      token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDUxZTlmYTViMDZhMjgyY2NlOTkwZTY4YTM5NmMyNDJiNDQ2YWQwOTdmZTNkMTUxMzI1YzVkNjM1ZmY2ZGEzNzRhNDFmNzY4ZWQyMDM5MjciLCJpYXQiOjE2NzU5NTg4MDguODQxMDY5LCJuYmYiOjE2NzU5NTg4MDguODQxMDczLCJleHAiOjE3MDc0OTQ4MDguODMwNjgxLCJzdWIiOiI5OCIsInNjb3BlcyI6W119.yN4JScpxjjX3-XuT3WjndwLo4VmSXQeokJhPyBEV7yKMEtbLEjVC_W2zsBifI_KtBAdHLva7s-IzP5lOviydnRy35NIt77CsrmjXv8xfwHnWLjBQ4NIm3cH-R7sHBEjOxPfuP9zjyEKXP1b6MbR0x5IMZgM2jW9di2MVAyUWwzqfi1NNQc-EThhAfQbwlwIBiyjtJcxaELAolgoO9-hcHV6YUMzfC_cWvktK3agNHh_V_TxnrUJ13BgCO_5D1fZ8Z-A5ARPzRqtPM-nkAEGR6347zz812EaquCvbgg5p7Y2mGvvbogwQDCeSB3H5baO0Z11jTCMssX33Iv1mXJwVswd0zGtAwPaLFovX55i_kfYXuzrh2gpy-15WryaysQIkhmlRT7h6IumUMPWPpPhbECqbVSVw6hBLyai-BowTylmaDoWsLkJK9fHkpDrhAeqxM9qYF-9GZ7uodHsX21ATyIxoEpLjfU44UAaSUEHaaEQoei9xDjkHPSuzcSURmIg1VxEAa_ivJEt2uztY05PCucWx6hoosO6FO0mCdCnn0K4cbArciKoh6oknkPqC_1qfJmrPF47bJbyg9moy3TVrs-47uHesjpCCZS3lzN9PZXzFXgVti81QzWwNjTQNfQ_Jb1S9rs9ip4zeCMvxVdeHG30nxYR1wXZrXii87SFu-FY',
                                      senderId: '98',
                                    )));
                      },
                      child: Column(
                        children: const [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue,
                            child: Text("T"),
                          ),
                          Text("Iam mohamed Click to Chat with Tarek",textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
        ),
      ),
          )),
    );
  }
}
