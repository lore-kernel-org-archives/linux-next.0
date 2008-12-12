From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: cifs tree build failure
Date: Fri, 12 Dec 2008 14:32:20 +1100
Message-ID: <20081212143220.a9f4d207.sfr@canb.auug.org.au>
References: <20081202132318.7e1581db.sfr@canb.auug.org.au>
	<20081203135312.60d4518d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48190 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751138AbYLLDcd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Dec 2008 22:32:33 -0500
In-Reply-To: <20081203135312.60d4518d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org
Cc: linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jeff Layton <jlayton@redhat.com>

Hi Steve,

On Wed, 3 Dec 2008 13:53:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today I have fixed this by applying a merge fix patch (see below) and
> will carry this as necessary.

An even better fix (as far as I am concerned) would be for you to pull
the net tree into the cifs tree (since the net tree will *never* rebase,
this is safe) and then apply the following two fixups as part of the
merge.  Or if you want to rebase the cifs tree, then use a merge of
Linus' tree and the net tree as the base and fix up the relevent commits
with the following.

That way, I don't have to carry these fixups ...  I have had to reapply
the fist once already as things continue to change.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/cifs/connect.c
index 204bd13,3519420..0000000
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@@ -2228,8 -2269,12 +2269,12 @@@ cifs_mount(struct super_block *sb, stru
  
  		/* new SMB session uses our srvTcp ref */
  		pSesInfo->server = srvTcp;
- 		sprintf(pSesInfo->serverName, "%pI4",
- 			&sin_server->sin_addr.s_addr);
+ 		if (srvTcp->addr.sockAddr6.sin6_family == AF_INET6)
 -			sprintf(pSesInfo->serverName, NIP6_FMT,
 -				NIP6(srvTcp->addr.sockAddr6.sin6_addr));
++			sprintf(pSesInfo->serverName, "%pI6",
++				&srvTcp->addr.sockAddr6.sin6_addr);
+ 		else
 -			sprintf(pSesInfo->serverName, NIPQUAD_FMT,
 -				NIPQUAD(srvTcp->addr.sockAddr.sin_addr.s_addr));
++			sprintf(pSesInfo->serverName, "%pI4",
++				&srvTcp->addr.sockAddr.sin_addr.s_addr);
  
  		write_lock(&cifs_tcp_ses_lock);
  		list_add(&pSesInfo->smb_ses_list, &srvTcp->smb_ses_list);

diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
index 061a1dc..1b09330 100644
--- a/fs/cifs/cifsfs.c
+++ b/fs/cifs/cifsfs.c
@@ -362,12 +362,12 @@ cifs_show_options(struct seq_file *s, struct vfsmount *m)
 					switch (server->addr.sockAddr6.
 						sin6_family) {
 					case AF_INET6:
-						seq_printf(s, NIP6_FMT,
-							   NIP6(server->addr.sockAddr6.sin6_addr));
+						seq_printf(s, "%pI6",
+							   &server->addr.sockAddr6.sin6_addr);
 						break;
 					case AF_INET:
-						seq_printf(s, NIPQUAD_FMT,
-							   NIPQUAD(server->addr.sockAddr.sin_addr.s_addr));
+						seq_printf(s, "%pI4",
+							   &server->addr.sockAddr.sin_addr.s_addr);
 						break;
 					}
 				}
