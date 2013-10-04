From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: Build failure after merge of the char-misc tree
Date: Thu, 3 Oct 2013 17:11:34 -0700
Message-ID: <20131004001134.GA29624@kroah.com>
References: <20131003235419.GG27287@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:59268 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751826Ab3JDALg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Oct 2013 20:11:36 -0400
Content-Disposition: inline
In-Reply-To: <20131003235419.GG27287@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>, Dasaratharaman Chandramouli <dasaratharaman.chandramouli@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Tejun Heo <tj@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>

On Fri, Oct 04, 2013 at 12:54:19AM +0100, Mark Brown wrote:
> After merging the char-misc tree into -next an x86 allmodconfig build=
 fails
> with:
>=20
> drivers/misc/mic/host/mic_main.c: In function =E2=80=98mic_probe=E2=80=
=99:
> drivers/misc/mic/host/mic_main.c:320:3: error: too many arguments to =
function =E2=80=98sysfs_get_dirent=E2=80=99
>    NULL, "state");
>    ^
> In file included from include/linux/kobject.h:21:0,
>                  from include/linux/module.h:16,
>                  from drivers/misc/mic/host/mic_main.c:26:
> include/linux/sysfs.h:465:1: note: declared here
>  sysfs_get_dirent(struct sysfs_dirent *parent_sd, const unsigned char
> *name)
>  ^
> make[4]: *** [drivers/misc/mic/host/mic_main.o] Error 1
>=20
> caused by an interaction between the addition of the Intel MIC host
> driver and commit 388975cccaaf1 (sysfs: clean up sysfs_get_dirent())
> from the driver-current tree.
>=20
> I've applied the patch below and can carry it for the time being.
>=20
> From abbabb4580f45accf74f95aed6fe35b26ae8d009 Mon Sep 17 00:00:00 200=
1
> From: Mark Brown <broonie@linaro.org>
> Date: Fri, 4 Oct 2013 00:53:01 +0100
> Subject: [PATCH] misc: mic: Update for sysfs_get_dirent() cleanups
>=20
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  drivers/misc/mic/host/mic_main.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

That patch looks great, thanks.

greg k-h
