From: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: next 20080530: ubifs build errors
Date: Mon, 02 Jun 2008 08:42:49 +0300
Message-ID: <1212385369.31023.147.camel@sauron>
References: <20080530093147.cc1d389f.randy.dunlap@oracle.com>
Reply-To: dedekind@infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.230]:47120 "EHLO
	mgw-mx03.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751110AbYFBFmn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Jun 2008 01:42:43 -0400
In-Reply-To: <20080530093147.cc1d389f.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, linux-mtd@lists.infradead.org, akpm <akpm@linux-foundation.org>

On Fri, 2008-05-30 at 09:31 -0700, Randy Dunlap wrote:
> with:
> CONFIG_UBIFS_FS=3Dy
> # CONFIG_UBIFS_FS_XATTR is not set
> CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> # CONFIG_UBIFS_FS_LZO is not set
> # CONFIG_UBIFS_FS_ZLIB is not set
> # CONFIG_UBIFS_FS_DEBUG is not set
>=20
> build gets:
> fs/built-in.o: In function `compr_exit':
> compress.c:(.text+0x4a3fc): undefined reference to `crypto_free_tfm'
> fs/built-in.o: In function `compr_init':
> compress.c:(.init.text+0x11d4): undefined reference to `crypto_alloc_=
base'
> make[1]: *** [.tmp_vmlinux1] Error 1
>=20
>=20
> because CRYPTO is not enabled.

=46ixed, pushed to the git tree, thank you!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

--
To unsubscribe from this list: send the line "unsubscribe linux-next" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
