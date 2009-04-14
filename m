From: Subrata Modak <subrata@linux.vnet.ibm.com>
Subject: [BUILD FAILURE 03/04] Next April 14 : x86 randconfig
	[sound/oss/sequencer.c]
Date: Tue, 14 Apr 2009 23:57:33 +0530
Message-ID: <1239733654.5344.71.camel@subratamodak.linux.ibm.com>
Reply-To: subrata@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e8.ny.us.ibm.com ([32.97.182.138]:36818 "EHLO e8.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758542AbZDNS1m (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2009 14:27:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>, Hannu Savolainen <hannu@voxware.pp.fi>, Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, sachinp <sachinp@linux.vnet.ibm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>

Observed the following build error:
---
CC [M]  sound/oss/sequencer.o
sound/oss/sequencer.c: In function =E2=80=98sequencer_ioctl=E2=80=99:
sound/oss/sequencer.c:1325: warning: =E2=80=98err=E2=80=99 may be used =
uninitialized in
this function
  CC [M]  sound/oss/sound_timer.o
  CC [M]  sound/oss/sys_timer.o
  LD [M]  sound/oss/sound.o
  CC [M]  sound/oss/aedsp16.o
make[2]: *** No rule to make target `/etc/sound/dsp001.ld', needed by
`sound/oss/pss_boot.h'.  Stop.
make[1]: *** [sound/oss] Error 2
make: *** [sound] Error 2
---

Regards--
Subrata
