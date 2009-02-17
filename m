From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the v4l-dvb tree
Date: Tue, 17 Feb 2009 19:28:31 +1100
Message-ID: <20090217192831.c22ad27b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56183 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751241AbZBQI2h (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 03:28:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, Jean-Francois Moine <moinejf@free.fr>, Mauro Carvalho Chehab <mchehab@redhat.com>, Tobias Klauser <tklauser@distanz.ch>

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
drivers/media/video/gspca/t613.c between commit
99a9fcc84dd6310b724f6dca684043f1cd33f00d ("V4L/DVB (10381): gspca - t613:
New unknown sensor added") from the v4l-dvb tree and commit
3c2e94a5fac4daac0bacd432ceeaff067957ee2b ("trivial: V4L: Storage class
should be before const qualifier") from the trivial tree.

Juts context changes.  I fixed it up (see below) and can carry the fix as
necessary.  Jiri, maybe some of these could be fed to the appropriate
maintainers?
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/media/video/gspca/t613.c
index 0a1f4ef,8b8c029..0000000
--- a/drivers/media/video/gspca/t613.c
+++ b/drivers/media/video/gspca/t613.c
@@@ -264,50 -263,28 +264,50 @@@ static const struct v4l2_pix_format vga
  
  /* sensor specific data */
  struct additional_sensor_data {
 -	const __u8 data1[20];
 -	const __u8 data2[18];
 -	const __u8 data3[18];
 -	const __u8 data4[4];
 -	const __u8 data5[6];
 -	const __u8 stream[4];
 +	const u8 data1[10];
 +	const u8 data2[9];
 +	const u8 data3[9];
 +	const u8 data4[4];
 +	const u8 data5[6];
 +	const u8 stream[4];
  };
  
- const static struct additional_sensor_data sensor_data[] = {
+ static const struct additional_sensor_data sensor_data[] = {
 +    {				/* OM6802 */
 +	.data1 =
 +		{0xc2, 0x28, 0x0f, 0x22, 0xcd, 0x27, 0x2c, 0x06,
 +		 0xb3, 0xfc},
 +	.data2 =
 +		{0x80, 0xff, 0xff, 0x80, 0xff, 0xff, 0x80, 0xff,
 +		 0xff},
 +	.data4 =	/*Freq (50/60Hz). Splitted for test purpose */
 +		{0x66, 0xca, 0xa8, 0xf0},
 +	.data5 =	/* this could be removed later */
 +		{0x0c, 0x03, 0xab, 0x13, 0x81, 0x23},
 +	.stream =
 +		{0x0b, 0x04, 0x0a, 0x78},
 +    },
 +    {				/* OTHER */
 +	.data1 =
 +		{0xc1, 0x48, 0x04, 0x1b, 0xca, 0x2e, 0x33, 0x3a,
 +		 0xe8, 0xfc},
 +	.data2 =
 +		{0x4e, 0x9c, 0xec, 0x40, 0x80, 0xc0, 0x48, 0x96,
 +		 0xd9},
 +	.data4 =
 +		{0x66, 0x00, 0xa8, 0xa8},
 +	.data5 =
 +		{0x0c, 0x03, 0xab, 0x29, 0x81, 0x69},
 +	.stream =
 +		{0x0b, 0x04, 0x0a, 0x00},
 +    },
      {				/* TAS5130A */
  	.data1 =
 -		{0xd0, 0xbb, 0xd1, 0x28, 0xd2, 0x10, 0xd3, 0x10,
 -		 0xd4, 0xbb, 0xd5, 0x28, 0xd6, 0x1e, 0xd7, 0x27,
 -		 0xd8, 0xc8, 0xd9, 0xfc},
 +		{0xbb, 0x28, 0x10, 0x10, 0xbb, 0x28, 0x1e, 0x27,
 +		 0xc8, 0xfc},
  	.data2 =
 -		{0xe0, 0x60, 0xe1, 0xa8, 0xe2, 0xe0, 0xe3, 0x60,
 -		 0xe4, 0xa8, 0xe5, 0xe0, 0xe6, 0x60, 0xe7, 0xa8,
 -		 0xe8, 0xe0},
 -	.data3 =
 -		{0xc7, 0x60, 0xc8, 0xa8, 0xc9, 0xe0, 0xca, 0x60,
 -		 0xcb, 0xa8, 0xcc, 0xe0, 0xcd, 0x60, 0xce, 0xa8,
 -		 0xcf, 0xe0},
 +		{0x60, 0xa8, 0xe0, 0x60, 0xa8, 0xe0, 0x60, 0xa8,
 +		 0xe0},
  	.data4 =	/* Freq (50/60Hz). Splitted for test purpose */
  		{0x66, 0x00, 0xa8, 0xe8},
  	.data5 =
