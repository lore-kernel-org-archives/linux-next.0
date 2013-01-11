From: Brian King <brking@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Fri, 11 Jan 2013 09:27:10 -0600
Message-ID: <50F02F4E.4070804@linux.vnet.ibm.com>
References: <20130111120323.cdc06081d0fb1c498c9f1779@canb.auug.org.au> <1357889656.3065.2.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-scsi-owner@vger.kernel.org>
In-Reply-To: <1357889656.3065.2.camel@dabdike.int.hansenpartnership.com>
Sender: linux-scsi-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wen Xiong <wenxiong@linux.vnet.ibm.com>, Greg KH <greg@kroah.com>, linux-scsi <linux-scsi@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

It looks like this was a due to the fact that the new patches
added __devinit tags in the same merge window the __devinit tag
itself was getting removed.

As to the sparse warnings, this patch fixed the ones that
were actual bugs in the new code, although we could have
made that more clear in the patch description.

http://marc.info/?l=linux-scsi&m=135716576204083&w=2

There is one outstanding issue I am aware of which was an
array bounds compiler warning which looks to be a misdetection
by the compiler. Wendy and I discussed adding a BUG_ON
to stop the compiler from complaining.

Wendy - lets queue these two changes up ASAP. They should both
be very simple changes.

Thanks,

Brian


On 01/11/2013 01:34 AM, James Bottomley wrote:
> On Fri, 2013-01-11 at 12:03 +1100, Stephen Rothwell wrote:
>> Hi James,
>>
>> After merging the scsi tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>>
>> drivers/scsi/ipr.c:9138:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'ipr_enable_msix'
>> drivers/scsi/ipr.c:9165:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'ipr_enable_msi'
>> drivers/scsi/ipr.c:9188:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'name_msi_vectors'
>> drivers/scsi/ipr.c:9200:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'ipr_request_other_msi_irqs'
>> drivers/scsi/ipr.c: In function 'ipr_probe_ioa':
>> drivers/scsi/ipr.c:9422:4: error: implicit declaration of function 'ipr_enable_msix' [-Werror=implicit-function-declaration]
>> drivers/scsi/ipr.c:9425:4: error: implicit declaration of function 'ipr_enable_msi' [-Werror=implicit-function-declaration]
>> drivers/scsi/ipr.c:9517:3: error: implicit declaration of function 'name_msi_vectors' [-Werror=implicit-function-declaration]
>> drivers/scsi/ipr.c:9523:4: error: implicit declaration of function 'ipr_request_other_msi_irqs' [-Werror=implicit-function-declaration]
> 
> OK, fine, I'll drop all the ipr patches.  I've been waiting for a month
> for them to fix the smatch and sparse warnings.  Please resend the
> series with all the fixes.
> 
> Thanks,
> 
> James
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-scsi" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
Brian King
Power Linux I/O
IBM Linux Technology Center


