From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: linux-next: manual merge of the logfs tree with Linus' tree
Date: Thu, 3 Nov 2011 02:25:04 +0100
Message-ID: <20111103012504.GC3485@logfs.org>
References: <20111101141000.3531dbfbf0490c6d3521d6b6@canb.auug.org.au> <20111102190046.GB3485@logfs.org> <20111103120257.c0c13ebacc8d245ca75edbf1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from [85.183.114.52] ([85.183.114.52]:45683 "EHLO Dublin.logfs.org"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753516Ab1KCBYI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Nov 2011 21:24:08 -0400
Content-Disposition: inline
In-Reply-To: <20111103120257.c0c13ebacc8d245ca75edbf1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Prasad Joshi <prasadjoshi.linux@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josef Bacik <josef@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>

On Thu, 3 November 2011 12:02:57 +1100, Stephen Rothwell wrote:
> On Wed, 2 Nov 2011 20:00:46 +0100 J=C3=B6rn Engel <joern@logfs.org> w=
rote:
> > On Tue, 1 November 2011 14:10:00 +1100, Stephen Rothwell wrote:
> > >=20
> > > Today's linux-next merge of the logfs tree got a conflict in
> > > fs/logfs/file.c between commit 02c24a82187d ("fs: push i_mutex an=
d
> > > filemap_write_and_wait down into ->fsync() handlers") from Linus'=
 tree
> > > and commit 39da12ef4bbe ("logfs: take write mutex lock during fsy=
nc and
> > > sync") from the logfs tree.
> > >=20
> > > I have no idea what needs to be done here.  I fixed it like below=
 to make
> > > it build, but a better fix is needed.
> >=20
> > From a code perspective your fix below is correct, to the best of m=
y
> > judgement.  I'm less sure what to do from a git perspective.
> > Explicitly tell Linus about it in the logfs pull request?
>=20
> I was concered about the locking order (or if both locks were needed =
at
> all).  And, yes, tell Linus.

Locking order should be fine.  Whether both locks are needed is a
valid question.  I suspect the answer is yes.

J=C3=B6rn

--=20
Simplicity is prerequisite for reliability.
-- Edsger W. Dijkstra
