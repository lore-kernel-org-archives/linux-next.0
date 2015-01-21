From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] staging/lustre/llite: get rid of backing_dev_info
Date: Wed, 21 Jan 2015 10:41:00 -0700
Message-ID: <54BFE4AC.5010609@kernel.dk>
References: <20150121144558.79cb2056@canb.auug.org.au> <1421827847-8371-1-git-send-email-green@linuxhacker.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:43173 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751713AbbAURlE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Jan 2015 12:41:04 -0500
Received: by mail-pd0-f173.google.com with SMTP id fp1so26149627pdb.4
        for <linux-next@vger.kernel.org>; Wed, 21 Jan 2015 09:41:02 -0800 (PST)
In-Reply-To: <1421827847-8371-1-git-send-email-green@linuxhacker.ru>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: green@linuxhacker.ru, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, "<linux-kernel@vger.kernel.org> Mailing List" <linux-kernel@vger.kernel.org>, Andreas Dilger <andreas.dilger@intel.com>, Christoph Hellwig <hch@lst.de>

On 01/21/2015 01:10 AM, green@linuxhacker.ru wrote:
> From: Oleg Drokin <green@linuxhacker.ru>
>
> With removal of backing_dev_info from struct address_space,
> we don't need to assign it in Lustre either.

Thanks Oleg, applied. Stephen, you should be able to drop the BROKEN 
lustre patch again.

-- 
Jens Axboe
