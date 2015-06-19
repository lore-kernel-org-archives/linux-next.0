From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Date: Fri, 19 Jun 2015 14:47:26 +1000
Message-ID: <1434689246.23771.6.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47839 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750890AbbFSEr3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Jun 2015 00:47:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

After merging the v4l-dvb tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

  drivers/media/platform/sti/bdisp/bdisp-debug.c: In function 'bdisp_dbg_perf':
  drivers/media/platform/sti/bdisp/bdisp-debug.c:600:50: error: expected ';' before ')' token
     min_fps = SECOND / (s32)bdisp->dbg.min_duration);
                                                    ^
  drivers/media/platform/sti/bdisp/bdisp-debug.c:600:50: error: expected statement before ')' token


Caused by commit fdf11845cbc1 "bdisp-debug: don't try to divide by s64":

  @@ -585,16 +587,27 @@ static int bdisp_dbg_perf(struct seq_file *s, void *data)
          }

          avg_time_us = bdisp->dbg.tot_duration;
  -       do_div(avg_time_us, request->nb_req);
  -
  -       avg_fps = 1000000;
  -       min_fps = 1000000;
  -       max_fps = 1000000;
  -       last_fps = 1000000;
  -       do_div(avg_fps, avg_time_us);
  -       do_div(min_fps, bdisp->dbg.min_duration);
  -       do_div(max_fps, bdisp->dbg.max_duration);
  -       do_div(last_fps, bdisp->dbg.last_duration);
  +       div64_s64(avg_time_us, request->nb_req);
  +
  +       if (avg_time_us > SECOND)
  +               avg_fps = 0;
  +       else
  +               avg_fps = SECOND / (s32)avg_time_us;
  +
  +       if (bdisp->dbg.min_duration > SECOND)
  +               min_fps = 0;
  +       else
  +               min_fps = SECOND / (s32)bdisp->dbg.min_duration);
                                                                 ^

I fixed it up for today.

cheers
