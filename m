From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the akpm tree with the userns tree
Date: Wed, 16 May 2012 07:49:16 -0700
Message-ID: <87ehqk5ggj.fsf@xmission.com>
References: <20120516193712.32157bcdc435465c27183baf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:44647 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752453Ab2EPOt3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 May 2012 10:49:29 -0400
In-Reply-To: <20120516193712.32157bcdc435465c27183baf@canb.auug.org.au>
	(Stephen Rothwell's message of "Wed, 16 May 2012 19:37:12 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Andrew,
>
> Today's linux-next merge of the akpm tree got a conflict in
> kernel/signal.c between commit 54ba47edac90 ("userns: signal remove
> unnecessary map_cred_ns") from the userns tree and commit "pidns: use
> task_active_pid_ns in do_notify_parent" from the akpm tree.
>
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Thanks.

Eric
