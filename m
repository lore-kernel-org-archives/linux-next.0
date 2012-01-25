From: Cong Wang <amwang@redhat.com>
Subject: Re: linux-next: manual merge of the kmap_atomic tree with the
 ecryptfs tree
Date: Wed, 25 Jan 2012 20:35:21 +0800
Message-ID: <1327494921.17654.10.camel@cr0>
References: <20120125133201.faa14529e7f872d38a714fb5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:36376 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752665Ab2AYMfd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jan 2012 07:35:33 -0500
In-Reply-To: <20120125133201.faa14529e7f872d38a714fb5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>

On Wed, 2012-01-25 at 13:32 +1100, Stephen Rothwell wrote:
> Hi Cong,
> 
> Today's linux-next merge of the kmap_atomic tree got a conflict in
> fs/ecryptfs/read_write.c between commit f28b7904d455 ("eCryptfs: Remove
> unused ecryptfs_read()") from the ecryptfs tree and commit 27de090e3326
> ("ecryptfs: remove the second argument of k[un]map_atomic()") from the
> kmap_atomic tree.
> 
> The former just removed the entire ecryptfs_read() function that was
> modified as part of the latter, so I did that.
> 

Hi, Stephen,

Sounds good to me! Thank you!
