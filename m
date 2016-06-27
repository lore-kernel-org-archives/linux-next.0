From: Trond Myklebust <trondmy@gmail.com>
Subject: Re: linux-next: build failure after merge of the nfs tree
Date: Mon, 27 Jun 2016 11:44:45 -0400
Message-ID: <12838D4D-17A4-4D7B-B7C7-702D5DDB888E@gmail.com>
References: <20160627105839.763d6d22@canb.auug.org.au>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35091 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751872AbcF0PpC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Jun 2016 11:45:02 -0400
In-Reply-To: <20160627105839.763d6d22@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: List Linux Next Mailing <linux-next@vger.kernel.org>, linux-kernel@vger.kernel.org


> On Jun 26, 2016, at 20:58, Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
>=20
> Hi Trond,
>=20
> After merging the nfs tree, today's linux-next build (x86_64 allmodco=
nfig)
> failed like this:
>=20
> fs/nfs/pnfs_nfs.c: In function 'pnfs_nfs_generic_sync':
> fs/nfs/pnfs_nfs.c:947:8: error: too few arguments to function 'nfs_co=
mmit_inode'
> ret =3D nfs_commit_inode(inode);
>       ^
> In file included from fs/nfs/pnfs_nfs.c:10:0:
> include/linux/nfs_fs.h:509:13: note: declared here
> extern int  nfs_commit_inode(struct inode *, int);
>            ^
>=20
> Caused by commit
>=20
> 292cc573fce6 ("pNFS: Files and flexfiles always need to commit before=
 layoutcommit")
>=20
> I have used the nsf tree from next-20160624 for today
>=20

Hi Stephen,

My apologies: That was a last minute typo when amending a commit. I=E2=80=
=99ve fixed the code in today=E2=80=99s linux-next branch.

Cheers
 Trond--
To unsubscribe from this list: send the line "unsubscribe linux-next" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
