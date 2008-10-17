From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: Re: BUG: sleeping function called from invalid context at kernel/rwsem.c:131 XFS? (was: Re: linux-next: Tree for October 17)
Date: Fri, 17 Oct 2008 21:13:04 +0400
Message-ID: <a4423d670810171013g5bc19c1cm3f7d9c014ee70349@mail.gmail.com>
References: <a4423d670810170543vd6b4c39p44bf125610d8540@mail.gmail.com>
	 <20081017164116.GA17375@infradead.org>
	 <a4423d670810170954h7ca130aaw8895380a4c6b125@mail.gmail.com>
	 <20081017165738.GA20818@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ag-out-0708.google.com ([72.14.246.242]:11902 "EHLO
	ag-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755229AbYJQRNF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Oct 2008 13:13:05 -0400
Received: by ag-out-0708.google.com with SMTP id 31so985246agc.10
        for <linux-next@vger.kernel.org>; Fri, 17 Oct 2008 10:13:04 -0700 (PDT)
In-Reply-To: <20081017165738.GA20818@infradead.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: xfs@oss.sgi.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

2008/10/17 Christoph Hellwig <hch@infradead.org>:
> Very strange.  Can you retry with tomorrow Linux-next which should have
> a large XFS update?  If it still happens I'll investigate it in more
> detail.

I have tried next-20081016 with the same result.
I am afraid I wont be able to test it tomorrow, it will likely be
possible on Monday.
