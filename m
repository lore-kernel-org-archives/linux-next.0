From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: linux-next: Tree for November 27 (logfs: hash_index)
Date: Sat, 28 Nov 2009 13:43:36 +0100
Message-ID: <20091128124336.GA19205@logfs.org>
References: <20091127181915.a6af7ba3.sfr@canb.auug.org.au> <4B10A04A.7090703@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754062AbZK1Mnr@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B10A04A.7090703@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, 27 November 2009 20:00:10 -0800, Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20091126:
>=20
>=20
> on i386 (X86_32):
>=20
> fs/built-in.o: In function `hash_index':
> dir.c:(.text+0x6c1f2): undefined reference to `__umoddi3'

Oops!  Fixed now.

J=C3=B6rn

--=20
Linux is more the core point of a concept that surrounds "open source"
which, in turn, is based on a false concept. This concept is that
people actually want to look at source code.
-- Rob Enderle
