From: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Mon, 3 Nov 2014 10:31:48 -0800
Message-ID: <20141103183148.GA26428@infradead.org>
References: <20141103135229.7916c23c@canb.auug.org.au>
 <545733ED.2080705@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35028 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751536AbaKCSbv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2014 13:31:51 -0500
Content-Disposition: inline
In-Reply-To: <545733ED.2080705@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hannes Reinecke <hare@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Bottomley <James.Bottomley@HansenPartnership.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>

Thanks, I've folded that patch into the one that caused the issue.
