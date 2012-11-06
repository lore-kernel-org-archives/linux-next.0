From: Adil Mujeeb <mujeeb.adil@gmail.com>
Subject: Re: linux-next: Cloning error
Date: Tue, 6 Nov 2012 09:51:10 +0530
Message-ID: <CANBXnMnBn1D0MqvRhOnQe=uRcXWFq-_8T4G1Zw5Y8ReE7SC1-Q@mail.gmail.com>
References: <CANBXnM=3r=kkOP0uoZJuJcsZ56fZozxGziBedFLkDH-YT-MQZw@mail.gmail.com>
	<CANBXnMm+b=cAFTg=S2rxnXLznudMLNm8FFPWCSzHhb_qUP=vPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:47039 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753256Ab2KFEVN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Nov 2012 23:21:13 -0500
Received: by mail-ee0-f46.google.com with SMTP id b15so6462eek.19
        for <linux-next@vger.kernel.org>; Mon, 05 Nov 2012 20:21:10 -0800 (PST)
In-Reply-To: <CANBXnMm+b=cAFTg=S2rxnXLznudMLNm8FFPWCSzHhb_qUP=vPg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Hi list,

On Thu, Nov 1, 2012 at 7:11 PM, Adil Mujeeb <mujeeb.adil@gmail.com> wrote:

I tried again and getting same error:

----------8<---------------------
$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Cloning into linux-next...
remote: Counting objects: 2881327, done.
remote: Compressing objects: 100% (457639/457639), done.
remote: Total 2881327 (delta 2425431), reused 2850544 (delta 2394681)
Receiving objects: 100% (2881327/2881327), 579.96 MiB | 175 KiB/s, done.
Resolving deltas: 100% (2425431/2425431), done.
error: unable to create file
drivers/gpu/drm/nouveau/core/subdev/i2c/aux.c (No such file or
directory)
----------8<---------------------

Appreciate if anyone help me in this.

Regards,
Adil

> Hi List,
>
> Yesterday I was trying to clone the linux-next tree and it gave me error.
>
> ---------------------------------------------------------8<-----------------------------------------------
> $ git clone git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> Cloning into linux-next...
> remote: Counting objects: 2869337, done.
> remote: Compressing objects: 100% (458442/458442), done.
> Receiving objects: 100% (2869337/2869337), 575.53 MiB | 241 KiB/s, done.
> remote: Total 2869337 (delta 2414758), reused 2836387 (delta 2381920)
> Resolving deltas: 100% (2414758/2414758), done.
> error: unable to create file
> drivers/gpu/drm/nouveau/core/subdev/i2c/aux.c (No such file or
> directory)
> ---------------------------------------------------------8<-----------------------------------------------
>
> Is there anything wrong?
>
> Regards,
> Adil
