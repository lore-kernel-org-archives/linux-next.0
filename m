From: Ken Lewis <kennylewis@gmail.com>
Subject: [Patch 0/1] rt2x00lib.h has wrong headers
Date: Sat, 12 Sep 2009 09:18:00 +0100
Message-ID: <5a44caba0909120118l56d83dacy6b739673f0317593@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f206.google.com ([209.85.219.206]:62299 "EHLO
	mail-ew0-f206.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751859AbZILIR6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 12 Sep 2009 04:17:58 -0400
Received: by ewy2 with SMTP id 2so1691965ewy.17
        for <linux-next@vger.kernel.org>; Sat, 12 Sep 2009 01:18:00 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Patch for net/drivers/wireless/rt2x00/rt2x00lib.h correct -- the
headers don't match the function as used in rt2x00crypto.c

I've had this problem since next-20090903 and it is resolved by the patch
