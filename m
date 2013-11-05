From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the device-mapper tree
Date: Tue, 05 Nov 2013 15:44:26 -0700
Message-ID: <527974CA.6050102@kernel.dk>
References: <20131105135128.496b8b2f599d11f2d30ad70c@canb.auug.org.au>	<20131105032054.GA19421@redhat.com>	<20131105143248.551f68c3cd9fe1902860c1ff@canb.auug.org.au>	<20131105125456.GA25219@redhat.com>	<52791B33.9060001@kernel.dk> <20131106094257.43d679d08de823ee5064ddff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:41263 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755403Ab3KEWor (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2013 17:44:47 -0500
In-Reply-To: <20131106094257.43d679d08de823ee5064ddff@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Snitzer <snitzer@redhat.com>, Alasdair G Kergon <agk@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kent Overstreet <kmo@daterainc.com>, Joe Thornber <ejt@redhat.com>

On 11/05/2013 03:42 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Tue, 05 Nov 2013 09:22:11 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>>
>> Just a heads up that I plan on sending the block bits shortly, hopefully
>> merging sooner rather than later. This round is huge, so I'd like to get
>> it in asap.
> 
> Given the problems we have seen since the inclusion into linux-next of
> some of it, don't you think it could do with a little more bedding in?

It'll either simmer without problems for the next day or two, or the
immutable bits will get pushed to the next merge window.

-- 
Jens Axboe
