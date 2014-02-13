From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: mvebu_defconfig was renamed
Date: Thu, 13 Feb 2014 10:25:28 -0500
Message-ID: <52FCE3E8.6080507@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:34148 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751645AbaBMPnv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Feb 2014 10:43:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Stephen,

This recent build failure:

http://kisskb.ellerman.id.au/kisskb/target/16059/

is caused by a defconfig being renamed:

commit 7fc2def52fbf6cdfebf48c51ce8ec61202a1d4b9
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Mon Feb 10 19:19:59 2014 +0100

    ARM: mvebu: rename mvebu_defconfig to mvebu_v7_defconfig

so it will require a configuration change on your builders.

Thanks,
Paul.
