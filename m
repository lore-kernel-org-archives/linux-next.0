From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Nov 7
Date: Tue, 14 Nov 2017 11:36:23 +1100
Message-ID: <20171114113623.6d5bee19@canb.auug.org.au>
References: <20171107162217.382cd754@canb.auug.org.au>
        <CACPK8Xfd4nqkf=Lk3n6+TNHAAi327r0dkUfGypZ3TpR0LqfS4Q@mail.gmail.com>
        <20171108142050.7w3yliulxjeco3b7@dhcp22.suse.cz>
        <20171110123054.5pnefm3mczsfv7bz@dhcp22.suse.cz>
        <CACPK8Xe5uUKEytkRiszdX511b_cYTD-z3X=ZsMcNJ-NOYnXfuQ@mail.gmail.com>
        <20171113160314.9924b06b389d9055f00d6a81@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57231 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751113AbdKNAgZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 19:36:25 -0500
In-Reply-To: <20171113160314.9924b06b389d9055f00d6a81@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Joel Stanley <joel@jms.id.au>, Michal Hocko <mhocko@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Andrew,

On Mon, 13 Nov 2017 16:03:14 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
>
> Does this kernel have "fs/binfmt_elf.c: drop MAP_FIXED usage from
> elf_map" applied?  That patch was dropped due to runtime issues.

next-20171107 has that patch in it, next-20171108 does not.

-- 
Cheers,
Stephen Rothwell
