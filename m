From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 13 (gfs2 build error)
Date: Tue, 13 Jan 2009 13:31:40 -0800
Message-ID: <496D083C.3060109@oracle.com>
References: <20090113175145.cdfa9c6a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:51079 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753614AbZAMVcJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Jan 2009 16:32:09 -0500
In-Reply-To: <20090113175145.cdfa9c6a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, swhiteho@redhat.com, cluster-devel@redhat.com

Stephen Rothwell wrote:
> Hi all,
> 
> Today, I merged the updates to Linus' and the powerpc trees that happened
> during the day.
> 
> Changes since 20090112:


When CONFIG_FILE_LOCKING=n, this construct:

	.setlease	= generic_setlease,

refers to a macro, not a function, so the address of it
fails with:

fs/gfs2/ops_file.c:746: error: 'generic_
setlease' undeclared here (not in a function)

-- 
~Randy
