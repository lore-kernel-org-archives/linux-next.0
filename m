From: "Gabriel C" <nix.or.die@googlemail.com>
Subject: Re: linux-next: Tree for July 14
Date: Mon, 14 Jul 2008 13:43:17 +0200
Message-ID: <1820d69d0807140443x1c4ba0b3p46072164ea2fe48b@mail.gmail.com>
References: <20080714201249.947400d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.173]:18059 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757365AbYGNLnS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Jul 2008 07:43:18 -0400
Received: by ug-out-1314.google.com with SMTP id h2so220869ugf.16
        for <linux-next@vger.kernel.org>; Mon, 14 Jul 2008 04:43:17 -0700 (PDT)
In-Reply-To: <20080714201249.947400d0.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

2008/7/14 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi all,

Hi ,

>
> With the opening of the merge window, I am hoping my job becomes easier
> again ... :-)
>
> Changes since next-20080711:
>

make clean / mrproper is broken , I'm not sure when it broken , I'm
updating from
2.6.26-rc8-next-20080630.

...

crazy@thor:/work/crazy/linux/linux-next/git/linux-2.6$ LC_ALL=C make clean
scripts/Makefile.clean:17:
/work/crazy/linux/linux-next/git/linux-2.6/drivers/media/mdtv/Makefile:
No such file or directory
make[3]: *** No rule to make target
`/work/crazy/linux/linux-next/git/linux-2.6/drivers/media/mdtv/Makefile'.
 Stop.
make[2]: *** [drivers/media/mdtv] Error 2
make[1]: *** [drivers/media] Error 2
make: *** [_clean_drivers] Error 2

...

drivers/media/Makefile has 'obj-$(CONFIG_MDTV_ADAPTERS)  += mdtv/' but
I cannot see such a folder under drivers/media =). Removing mdtv from
Makefile fixes the problem.

Regards,

Gabriel
