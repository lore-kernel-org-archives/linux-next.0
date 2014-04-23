From: Max Filippov <jcmvbkbc@gmail.com>
Subject: KISSKB toolchain for xtensa
Date: Wed, 23 Apr 2014 15:23:42 +0400
Message-ID: <CAMo8BfLOL8-L5xxpB-hoovxPZ_Hnv5Wb8Zks=N37R5Q53dpUXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:51917 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751297AbaDWLXn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Apr 2014 07:23:43 -0400
Received: by mail-oa0-f54.google.com with SMTP id i7so833233oag.41
        for <linux-next@vger.kernel.org>; Wed, 23 Apr 2014 04:23:42 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>

Hi Stephen,

we've fixed a bug in xtensa binutils responsible for long time defconfig
build failures in KISSKB:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=a35d5e823fdfe8a6e7e05ca8e3fb8bb5697335b1

Would it be possible to update KISSKB toolchain for xtensa to include
this fix, or do we need to wait for the next official binutils release that
includes it and ask for update then?

-- 
Thanks.
-- Max
