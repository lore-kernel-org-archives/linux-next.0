From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: [GIT PULL v3] at91: devices and boards files update for 3.3
Date: Thu, 12 Jan 2012 12:42:09 +0100
Message-ID: <4F0EC711.1080704@atmel.com>
References: <20120111133146.990e2b7115c9fa80e8fc3234@canb.auug.org.au> <201201111450.02798.arnd@arndb.de> <4F0DB16B.3010302@atmel.com> <201201111646.24731.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from newsmtp5.atmel.com ([204.2.163.5]:21945 "EHLO
	sjogate2.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751457Ab2ALLmt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Jan 2012 06:42:49 -0500
In-Reply-To: <201201111646.24731.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>, "Wu, Josh" <Josh.wu@atmel.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Arnd, Olof,

This is the pull request about devices and boards files already
sent for 3.3 inclusion. This pull request is *without* the ISI
board/devices
patches that has been discussed earlier.

I have also tested the merging of those patches on top of today Linus'
tree
and it is going smoothly.

Thank you for your patience and understanding.


The following changes since commit
805a6af8dba5dfdd35ec35dc52ec0122400b2610:

  Linux 3.2 (2012-01-04 15:55:44 -0800)

are available in the git repository at:
  git://github.com/at91linux/linux-at91.git for-arnd-3.3-device_boardV3

Hong Xu (1):
      ARM: at91: Update struct atmel_nand_data to support PMECC

Nicolas Ferre (2):
      ARM: at91/dma: remove platform data from DMA controller
      ARM: at91/dma: DMA controller registering with DT support

 arch/arm/mach-at91/at91sam9g45_devices.c |   19 ++++++++++---------
 arch/arm/mach-at91/at91sam9rl_devices.c  |    8 +-------
 arch/arm/mach-at91/include/mach/board.h  |    2 ++
 3 files changed, 13 insertions(+), 16 deletions(-)

Best regards,
- -- 
Nicolas Ferre
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJPDscLAAoJEAf03oE53VmQUt8H+wV6uiURUj6MXRgPYhUrE38H
quMt9Qse/drY3MOx6UjK4fJWprl+JRsyIlHRaa564vRf9W14uPpwMoyRwtgOUbf+
x3IYBh+SD0DJgx/4RHvMCNlD7/0dQ4HoMVxTC5J0S5McoIYXttWqxY7QC4cMaCwa
jwLFU3mWHCNe4WWkN9j18KBI7gUfW6CVzgJCS8RFBYV/ieN6BqWbKK341cJ7Ubrp
VfHRhXAubJV2S/RwoCSOYvbAcANv0/HnVel0AOFD77uzqq6qtoLMeDew8JbaZGDT
AwVWZg4Lt8iInpYeTuIAieNF0Z+VxWhOkLjhZovJ6kwoXgbbNFjzEMO4WL2Xkvg=
=C5kr
-----END PGP SIGNATURE-----
