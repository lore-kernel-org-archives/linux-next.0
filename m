From: Sunil Mushran <sunil.mushran@oracle.com>
Subject: Re: linux-next: ocfs2 tree build failure
Date: Wed, 07 Jan 2009 18:14:45 -0800
Message-ID: <49656195.2070001@oracle.com>
References: <20090108130158.d222ceea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:18180 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751470AbZAHCPG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Jan 2009 21:15:06 -0500
In-Reply-To: <20090108130158.d222ceea.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Fasheh <mfasheh@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

http://oss.oracle.com/pipermail/ocfs2-devel/2008-December/003552.html

This needs to be added.

Stephen Rothwell wrote:
> Hi Mark,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> fs/ocfs2/super.c: In function 'ocfs2_osb_dump':
> fs/ocfs2/super.c:256: error: dereferencing pointer to incomplete type
> fs/ocfs2/super.c:256: error: dereferencing pointer to incomplete type
> fs/ocfs2/super.c:256: error: dereferencing pointer to incomplete type
> fs/ocfs2/super.c:259: error: dereferencing pointer to incomplete type
> fs/ocfs2/super.c:261: error: dereferencing pointer to incomplete type
>
> Caused by commit 796868c27387ba9bbad6b9c6b770ed34e2809a73 ("ocfs2: Expose
> the file system state via debugfs") since (despite being declared in
> fs/ocfs2/ocfs2.h) the struct ocfs2_recovery_map definition is not exposed
> beyond fs/ocfs2/journal.c.
>
> I have dropped the ocfs2 tree for today.
>   
