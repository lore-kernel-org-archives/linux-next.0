From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [POWERPC][next-20190603] Boot failure : Kernel BUG at
 mm/vmalloc.c:470
Date: Tue, 4 Jun 2019 19:09:26 +0530
Message-ID: <88ADCAAE-4F1A-49FE-A454-BBAB12A88C70@linux.vnet.ibm.com>
References: <9F9C0085-F8A4-4B66-802B-382119E34DF5@linux.vnet.ibm.com>
 <20190604202918.17a1e466@canb.auug.org.au>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604202918.17a1e466@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-mm@kvack.org, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org



> On 04-Jun-2019, at 3:59 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> Hi Sachin,
> 
> On Tue, 4 Jun 2019 14:45:43 +0530 Sachin Sant <sachinp@linux.vnet.ibm.com> wrote:
>> 
>> While booting linux-next [next-20190603] on a POWER9 LPAR following
>> BUG is encountered and the boot fails.
>> 
>> If I revert the following 2 patches I no longer see this BUG message
>> 
>> 07031d37b2f9 ( mm/vmalloc.c: switch to WARN_ON() and move it under unlink_va() )
>> 728e0fbf263e ( mm/vmalloc.c: get rid of one single unlink_va() when merge )
> 
> This latter patch has been fixed in today's linux-next …

Thanks Stephen. 
With today’s next (20190604) I no longer see this issue.

Thanks
-Sachin
