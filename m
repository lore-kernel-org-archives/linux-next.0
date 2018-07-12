From: Hannes Reinecke <hare@suse.de>
Subject: Re: linux-next: build warning after merge of the scsi-mkp tree
Date: Thu, 12 Jul 2018 08:10:08 +0200
Message-ID: <7526aa85-b9ad-d314-4fde-b3936457552c@suse.de>
References: <20180711141737.57c1e26f@canb.auug.org.au>
 <20180712143057.49bfcab5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712143057.49bfcab5@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Thumshirn <jth@kernel.org>
List-Id: linux-next.vger.kernel.org

On 07/12/2018 06:30 AM, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 11 Jul 2018 14:17:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the scsi-mkp tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>>
>> In file included from include/linux/spinlock_types.h:18:0,
>>                  from include/linux/spinlock.h:82,
>>                  from drivers/scsi/libfc/fc_rport.c:61:
>> drivers/scsi/libfc/fc_rport.c: In function 'fc_rport_recv_req':
>> include/linux/lockdep.h:347:45: warning: 'rdata' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>  #define lockdep_is_held(lock)  lock_is_held(&(lock)->dep_map)
>>                                              ^
>> drivers/scsi/libfc/fc_rport.c:1832:24: note: 'rdata' was declared here
>>   struct fc_rport_priv *rdata;
>>                         ^~~~~
>>
>> Introduced by commit
>>
>>   ee35624e1e4e ("scsi: libfc: Add lockdep annotations")
>>
>> It is actually complaining about function fc_rport_recv_plogi_req()
>> (presumably it is being inlined) and this looks like an actual bug :-(
> 
> This warning now appears after the merge of the scsi tree.
> 
I have send a new round of patches to the scsi mailing list (cf
'libfc/fcoe: disc_mutex fixes') which address this issue.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		   Teamlead Storage & Networking
hare@suse.de			               +49 911 74053 688
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: F. Imendörffer, J. Smithard, J. Guild, D. Upmanyu, G. Norton
HRB 21284 (AG Nürnberg)
