From: Prasun Maiti <prasunmaiti87@gmail.com>
Subject: [Query] mwifiex: few observations to reduce number of endian conversions
Date: Fri, 17 Jun 2016 18:41:39 +0530
Message-ID: <CAEO8o4=aLbrwHka8X2h-YUCeuKoWzU0q7JWLuuaYsRW=69q_DQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amitkumar Karwar <akarwar@marvell.com>, Nishant Sarmukadam <nishants@marvell.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Next <linux-next@vger.kernel.org>, WiFi Mailing List <linux-wireless@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>
List-Id: linux-next.vger.kernel.org

Hi Amitkumar,

I have two observations:

1. I have found that in the command response path for host command
"HostCmd_CMD_802_11_EEPROM_ACCESS", a "0" value has been endian
converted. It can only be a safe futuristic approach for any non-zero
value there however! Otherwise, the endian conversion can be removed.

2. For multiple Host Commands (e.g HostCmd_CMD_802_11_EEPROM_ACCESS
etc.) "cpu_to_leX"-converted values are saved to driver. So
"leX_to_cpu" conversion is required too many times afterwards in
driver.
On the contrary, we can save the values to driver without any
conversion, and only command buffer(s) are prepared with endian
converted values. In this way we can gain some efficiency [code size /
time] by reducing the number of endian conversion considerably.

Please let me know your opinion on the above.

-- 
Thanks,
Prasun
