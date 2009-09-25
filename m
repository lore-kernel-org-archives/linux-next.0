From: Steve French <smfrench@gmail.com>
Subject: Re: linux-next: cifs tree build failures
Date: Thu, 24 Sep 2009 22:13:46 -0500
Message-ID: <524f69650909242013r4d312204w9f8457c07db9dd24@mail.gmail.com>
References: <20090925095105.b06d77f3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f194.google.com ([209.85.216.194]:55541 "EHLO
	mail-px0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753199AbZIYDNm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Sep 2009 23:13:42 -0400
In-Reply-To: <20090925095105.b06d77f3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-cifs-client@lists.samba.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Layton <jlayton@redhat.com>

On Thu, Sep 24, 2009 at 6:51 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi all,
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>
> fs/cifs/cifsfs.c: In function 'init_cifs':
> fs/cifs/cifsfs.c:1047: error: implicit declaration of function 'unreg=
ister_key_type'
>
> Caused by commit 3bc303c254335dbd7c7012cc1760b12f1d5514d3 ("cifs: con=
vert
> oplock breaks to use slow_work facility (try #4)") exposing the call =
to
leinfo' was here
>
> I have reverted both those commits for today.
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au

These now are fixed in cifs-2.6.git.   In the same patch found a minor
locking problem which Jeff will fix tomorrow.


--=20
Thanks,

Steve
