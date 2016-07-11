From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rtc tree
Date: Mon, 11 Jul 2016 18:12:08 +1000
Message-ID: <20160711181208.2d60493a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>
List-Id: linux-next.vger.kernel.org

Hi Alexandre,

After merging the rtc tree, today's linux-next build (x86 64_allmodconfig)
produced this warning:

drivers/rtc/rtc-isl12057.c: In function 'isl12057_rtc_read_alarm':
drivers/rtc/rtc-isl12057.c:249:26: warning: unused variable 'alarm_secs' [-Wunused-variable]
  unsigned long rtc_secs, alarm_secs;
                          ^
drivers/rtc/rtc-isl12057.c:249:16: warning: unused variable 'rtc_secs' [-Wunused-variable]
  unsigned long rtc_secs, alarm_secs;
                ^
drivers/rtc/rtc-isl12057.c:248:18: warning: unused variable 'rtc_tm' [-Wunused-variable]
  struct rtc_time rtc_tm, *alarm_tm = &alarm->time;
                  ^

Introduced by commit

  4e30a585a343 ("rtc: isl12057: let the rtc core interpret the partial alarm")

-- 
Cheers,
Stephen Rothwell
