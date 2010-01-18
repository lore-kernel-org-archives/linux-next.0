From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: linux-next: vfs tree build warning
Date: Mon, 18 Jan 2010 15:34:15 +0100
Message-ID: <20100118143415.GA5700@logfs.org>
References: <20100118131128.a09d1021.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753287Ab0AROea@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100118131128.a09d1021.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Mon, 18 January 2010 13:11:28 +1100, Stephen Rothwell wrote:
>=20
> Today's linux-next build (x86_64_allmodconfig) produced this warning:
>=20
> fs/logfs/inode.c:399: warning: initialization from incompatible point=
er type
>=20
> Introduced by commit bc39e28236344af617473df80abb7de43176511e ("pass
> writeback_control to ->write_inode") from the vfs tree interacting wi=
th
> commit 5db53f3e80dee2d9dff5e534f9e9fe1db17c9936 ("[LogFS] add new fla=
sh
> file system") from the logfs tree.
>=20
> This will need a fixup patch (see below) which I can carry in the
> linux-next tree.  There may, of course, be a better fix (which I can
> carry if someone sends it to me).

Looks good enough for me for now.  Next week, after returning from
vacation, I'll have a closer look and update the logfs tree.

Thank you, Stephen!

J=C3=B6rn

--=20
Joern's library part 7:
http://www.usenix.org/publications/library/proceedings/neworl/full_pape=
rs/mckusick.a
