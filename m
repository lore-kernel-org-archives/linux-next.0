From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: staging: zsmalloc appears to break linux-next
Date: Tue, 6 Mar 2012 20:06:41 -0500
Message-ID: <CAP=VYLoSR2ygm98jhiVJ8FYTU-cjHvXpJRoNSUPeGdb515tSwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:41486 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031743Ab2CGBGm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Mar 2012 20:06:42 -0500
Received: by dadp12 with SMTP id p12so7255536dad.11
        for <linux-next@vger.kernel.org>; Tue, 06 Mar 2012 17:06:41 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gregkh@linuxfoundation.org, linux-next@vger.kernel.org

Hi Greg,

The allmodconfig in linux-next is failing on zsmalloc as follows:

drivers/staging/zsmalloc/zsmalloc-main.c:255: error:
'MAX_PHYSMEM_BITS' undeclared (first use in this function)

At 1st glance, it looks to be missing an include of asm/sparsemem.h

Fail log is here:

   http://kisskb.ellerman.id.au/kisskb/buildresult/5806748/

Apologies if this is something you are aware of already.
Paul.
