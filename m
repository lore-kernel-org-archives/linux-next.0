From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [RFC PATCH next] fix unpaired rcu lock in prepend_path()
Date: Wed, 13 Nov 2013 12:28:48 +0000
Message-ID: <20131113122848.GZ13318@ZenIV.linux.org.uk>
References: <1384327311.19669.8.camel@ThinkPad-T5421>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:45615 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758789Ab3KMM2u (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Nov 2013 07:28:50 -0500
Content-Disposition: inline
In-Reply-To: <1384327311.19669.8.camel@ThinkPad-T5421>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Li Zhong <zhong@linux.vnet.ibm.com>
Cc: linux-next list <linux-next@vger.kernel.org>

On Wed, Nov 13, 2013 at 03:21:51PM +0800, Li Zhong wrote:
> The patch tries to fix following complaint(next-1112) caused by unpaired
> rcu_read_lock/unlock in function prepend_path():

Frankly, I wonder if it wouldn't be better to shift rcu_read_unlock()
past the second done_seqretry() in there...
