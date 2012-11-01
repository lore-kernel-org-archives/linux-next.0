From: Adil Mujeeb <mujeeb.adil@gmail.com>
Subject: linux-next: Cloning error
Date: Thu, 1 Nov 2012 19:11:28 +0530
Message-ID: <CANBXnMm+b=cAFTg=S2rxnXLznudMLNm8FFPWCSzHhb_qUP=vPg@mail.gmail.com>
References: <CANBXnM=3r=kkOP0uoZJuJcsZ56fZozxGziBedFLkDH-YT-MQZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:38663 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761305Ab2KANl3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Nov 2012 09:41:29 -0400
Received: by mail-ee0-f46.google.com with SMTP id b15so1278164eek.19
        for <linux-next@vger.kernel.org>; Thu, 01 Nov 2012 06:41:28 -0700 (PDT)
In-Reply-To: <CANBXnM=3r=kkOP0uoZJuJcsZ56fZozxGziBedFLkDH-YT-MQZw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Hi List,

Yesterday I was trying to clone the linux-next tree and it gave me error.

---------------------------------------------------------8<-----------------------------------------------
$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Cloning into linux-next...
remote: Counting objects: 2869337, done.
remote: Compressing objects: 100% (458442/458442), done.
Receiving objects: 100% (2869337/2869337), 575.53 MiB | 241 KiB/s, done.
remote: Total 2869337 (delta 2414758), reused 2836387 (delta 2381920)
Resolving deltas: 100% (2414758/2414758), done.
error: unable to create file
drivers/gpu/drm/nouveau/core/subdev/i2c/aux.c (No such file or
directory)
---------------------------------------------------------8<-----------------------------------------------

Is there anything wrong?

Regards,
Adil
