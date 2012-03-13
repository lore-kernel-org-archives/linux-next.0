From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Mar 13 (dlm / gfs2)
Date: Tue, 13 Mar 2012 10:10:36 -0700
Message-ID: <4F5F7F8C.6030300@xenotime.net>
References: <20120313204114.e160849af7dbe5a4b4e5c0ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:41460 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752724Ab2CMRKf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Mar 2012 13:10:35 -0400
In-Reply-To: <20120313204114.e160849af7dbe5a4b4e5c0ad@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, cluster-devel@redhat.com

On 03/13/2012 02:41 AM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120309:



on i386:

ERROR: "sctp_do_peeloff" [fs/dlm/dlm.ko] undefined!


GFS2_FS selects DLM (if GFS2_FS_LOCKING_DLM, which is enabled).
GFS2_FS selects IP_SCTP if DLM_SCTP, which is not enabled and not
used anywhere else in the kernel tree AFAICT.
DLM just always selects IP_SCTP.


---

~Randy
