From: Christoph Hellwig <hch@infradead.org>
Subject: Re: next-20090220: XFS: inconsistent lock state
Date: Tue, 3 Mar 2009 12:02:48 -0500
Message-ID: <20090303170248.GA7036@infradead.org>
References: <a4423d670902200952v5dc2fd91w3b54ab1db51a7fe2@mail.gmail.com> <20090224200740.GA9266@infradead.org> <49AD5401.30803@sandeen.net> <A277CB1C-4258-42EC-B1D9-F5CAAB962B42@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:33293 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751837AbZCCRCv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Mar 2009 12:02:51 -0500
Content-Disposition: inline
In-Reply-To: <A277CB1C-4258-42EC-B1D9-F5CAAB962B42@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Felix Blyakher <felixb@sgi.com>
Cc: Eric Sandeen <sandeen@sandeen.net>, Christoph Hellwig <hch@infradead.org>, Alexander Beregalov <a.beregalov@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, xfs@oss.sgi.com

On Tue, Mar 03, 2009 at 10:57:07AM -0600, Felix Blyakher wrote:
> 	if (lock_flags) {
> 		if (!xfs_ilock_nowait(ip, lock_flags)) {
> 			ASSERT(0);
> 			error = EAGAIN;
> 			goto out_destroy;
> 		}
> 	}
> 				
> Or just keep the BUG(); , as it shouldn't happen (we hope).

Ok, let's keep the BUG for now and I'll throw in your error undwinding
fix.  Will resend the series for 2.6.29 patches after QAing them.
