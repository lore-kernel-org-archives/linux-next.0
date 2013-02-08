From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: build failure after merge of the nfsd tree
Date: Fri, 8 Feb 2013 16:19:37 -0500
Message-ID: <20130208211937.GC22748@fieldses.org>
References: <20130202130403.a29346b583a802ed6ce6880b@canb.auug.org.au>
 <20130202125719.GF30668@fieldses.org>
 <20130203144123.GA22854@fieldses.org>
 <51148FF1.4040108@parallels.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fieldses.org ([174.143.236.118]:54061 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1947114Ab3BHVTm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Feb 2013 16:19:42 -0500
Content-Disposition: inline
In-Reply-To: <51148FF1.4040108@parallels.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stanislav Kinsbursky <skinsbursky@parallels.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 08, 2013 at 09:41:05AM +0400, Stanislav Kinsbursky wrote:
> 03.02.2013 18:41, J. Bruce Fields =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >On Sat, Feb 02, 2013 at 07:57:19AM -0500, J. Bruce Fields wrote:
> >>On Sat, Feb 02, 2013 at 01:04:03PM +1100, Stephen Rothwell wrote:
> >>>Hi,
> >>>
> >>>After merging the nfsd tree, today's linux-next build (x86_64
> >>>allmodconfig) failed like this:
> >>>
> >>>fs/nfs/dns_resolve.c: In function 'nfs_dns_resolver_cache_init':
> >>>fs/nfs/dns_resolve.c:375:4: error: 'struct cache_detail' has no me=
mber named 'cache_upcall'
> >>>fs/nfs/dns_resolve.c:375:35: warning: left-hand operand of comma e=
xpression has no effect [-Wunused-value]
> >>>fs/nfs/dns_resolve.c:375:35: warning: value computed is not used [=
-Wunused-value]
> >>>fs/nfs/dns_resolve.c:375:35: warning: value computed is not used [=
-Wunused-value]
> >>>fs/nfs/dns_resolve.c:375:35: warning: value computed is not used [=
-Wunused-value]
> >>>fs/nfs/dns_resolve.c:375:35: warning: value computed is not used [=
-Wunused-value]
> >>>fs/nfs/dns_resolve.c:375:35: warning: value computed is not used [=
-Wunused-value]
> >>>fs/nfs/dns_resolve.c:375:35: warning: value computed is not used [=
-Wunused-value]
> >>>
> >>>Caused by commit aab982cb5dfb ("SUNRPC: remove cache_detail->cache=
_upcall
> >>>callback").
> >>
> >>Yes, I knew why we'd introduced cache_upcall, so I'm not sure how I
> >>overlooked that.  It must have slipped through testing because I di=
dn't
> >>set CONFIG_NFS_USE_KERNEL_DNS.
> >>
> >>We may just be able to revert that patch....  I can take care of th=
at by
> >>tomorrow.
> >
> >Stanislav, any objections to this?
> >
>=20
> The only objection is that I've sent you the patch set witch fixes al=
l these problems already:
>=20
> "[PATCH v2 0/6] SUNRPC: rework cache upcall to avoid NFSd root". :)
>=20
> The only reason why I removed cache_upcall at all was that all it's
> users (except NFS DNS cache - my mistake) just call
> sunrpc_cache_pipe_upcall and thus these wrapper looked redundant to
> me.
> Second patch set leaves cache_upcall only for NFS DNS cache (since th=
is upcall is not just a wrapper around sunrpc_cache_pipe_upcall).
> And second patch set implies the first one will be dropped.
> I can, actually, send one more (incremental  this time) patch set to =
fix the problem, if you wish.

No, the replacement series is fine.  I gave Trond another poke and then
they should get committed.--b.
