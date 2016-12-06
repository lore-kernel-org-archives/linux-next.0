From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: next-20161206 WARN@ mm/hugetlb.c:2918 during boot
Date: Tue, 6 Dec 2016 14:40:25 -0800
Message-ID: <ef890d7f-2918-4848-e77d-b10f528b7afe@intel.com>
References: <70A62042-92E6-414D-8FBD-BA0F5308944B@linux.vnet.ibm.com>
 <20161207092721.270fbc43@canb.auug.org.au>
 <CAKTCnzmxjf+v3t-o7GwZkWp1Wrff+o0B6CAt0Ehp8gv3pdQTOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:15806 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752112AbcLFWk1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Dec 2016 17:40:27 -0500
In-Reply-To: <CAKTCnzmxjf+v3t-o7GwZkWp1Wrff+o0B6CAt0Ehp8gv3pdQTOA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Balbir Singh <bsingharora@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linux-next <linux-next@vger.kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, Anton Blanchard <anton@samba.org>, Aneesh Kumar KV <aneesh.kumar@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>

On 12/06/2016 02:37 PM, Balbir Singh wrote:
> I think Michael found this as well, its related to adding our gigantic
> page to the hugetlb list
> and the WARN_ON that Dave Hansen added (commit
> a3a18061c987aa9da4f5d3cbb31a9e71e9d7191d)
> 
> I've not looked at this issue yet, Aneesh is aware of the issue as well

It's harmless, and I believe Andrew pulled it out of -mm.  So, just
ignore it for now.

Thanks for the report, though.
