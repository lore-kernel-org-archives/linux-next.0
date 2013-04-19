From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Fri, 19 Apr 2013 07:01:28 -0700
Message-ID: <CAOesGMhUTyPdNo=yaRqEv+Zhf7ga8e-R0asbnuje_LioWbqsgg@mail.gmail.com>
References: <20130419164636.0d2405ca5fd927f1ba31fe40@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:40086 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030348Ab3DSOB3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Apr 2013 10:01:29 -0400
Received: by mail-wg0-f44.google.com with SMTP id a12so149432wgh.35
        for <linux-next@vger.kernel.org>; Fri, 19 Apr 2013 07:01:28 -0700 (PDT)
In-Reply-To: <20130419164636.0d2405ca5fd927f1ba31fe40@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Bjorn Helgaas <bhelgaas@google.com>

On Thu, Apr 18, 2013 at 11:46 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the arm-soc tree, today's linux-next build (powerpc ppc64_defconfig)
> failed like this:
>
> powerpc64-linux-ld: cannot find drivers/pci/host/built-in.o: No such file or directory
>
> Caused by commit 9ecbe03ae85b ("pci: infrastructure to add drivers in
> drivers/pci/host").
>
> I have used the arm-soc tree from next-20130418 for today.

Sorry about that, I'll drop the branch that brought in the of_pci
consolidation from our repo.


-Olof
