From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: Signed-off-by missing for commits in the block tree
Date: Thu, 23 May 2019 16:54:01 -0600
Message-ID: <9eb52b2c-2148-8f87-dea9-15df4d50e9de@kernel.dk>
References: <20190524074500.1fde68d6@canb.auug.org.au>
 <20190523215206.GA15192@localhost.localdomain>
 <20190524083321.7ada6382@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524083321.7ada6382@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Keith Busch <kbusch@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Keith Busch <keith.busch@intel.com>
List-Id: linux-next.vger.kernel.org

On 5/23/19 4:33 PM, Stephen Rothwell wrote:
> Hi Keith,
> 
> On Thu, 23 May 2019 15:52:07 -0600 Keith Busch <kbusch@kernel.org> wrote:
>>
>> On Fri, May 24, 2019 at 07:45:00AM +1000, Stephen Rothwell wrote:
>>> Commits
>>>
>>>    5fb4aac756ac ("nvme: release namespace SRCU protection before performing controller ioctls")
>>>    90ec611adcf2 ("nvme: merge nvme_ns_ioctl into nvme_ioctl")
>>>    3f98bcc58cd5 ("nvme: remove the ifdef around nvme_nvm_ioctl")
>>>    100c815cbd56 ("nvme: fix srcu locking on error return in nvme_get_ns_from_disk")
>>>
>>> are missing a Signed-off-by from their committer.
>>
>> Oops, I'd only added my Reviewed-by. Do I need to update the commit
>> messages and resend, or is this just putting me on notice for next time?
> 
> That depends on Jens ...

Since they at least have a reviewed-by from the committer, I say we let
it slide this time.

-- 
Jens Axboe
