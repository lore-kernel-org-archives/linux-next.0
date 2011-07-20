From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the s5p tree with the arm-soc tree
Date: Wed, 20 Jul 2011 19:30:03 +0900
Message-ID: <064101cc46c8$240fcac0$6c2f6040$%kim@samsung.com>
References: <20110720113536.72c28c19d623c5e7f8604ca2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:25124 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751229Ab1GTKb0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Jul 2011 06:31:26 -0400
In-reply-to: <20110720113536.72c28c19d623c5e7f8604ca2@canb.auug.org.au>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Nicolas Pitre' <nicolas.pitre@linaro.org>, 'Arnd Bergmann' <arnd@arndb.de>, ben-linux@fluff.org

Stephen Rothwell wrote:
> 
> Hi Kukjin,
> 
Hi :)

> Today's linux-next merge of the s5p tree got conflicts in
drivers/tty/serial/s3c2400.c
> and drivers/tty/serial/s3c24a0.c between commits 632b7cf6c056 ("ARM: mach-
> s3c2400: delete") and af0e060e24ce ("ARM: mach-s3c24a0: delete")from the
arm-
> soc tree and commit 470805f8f958 ("serial: Remove redundant
console_initcall
> from s3c and s5p console drivers") from the s5p tree.
> 
> The former removes these files, so I did that.

OK, you're right.
As a note, I fixed my -next tree just now to avoid conflicts between
arm-soc.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
