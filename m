From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: mmotm 2015-01-22-15-04: qemu failure due to 'mm: memcontrol:
 remove unnecessary soft limit tree node test'
Date: Fri, 23 Jan 2015 12:33:33 -0800
Message-ID: <54C2B01D.4070303@roeck-us.net>
References: <54c1822d.RtdGfWPekQVAw8Ly%akpm@linux-foundation.org> <20150123050802.GB22751@roeck-us.net> <20150123141817.GA22926@phnom.home.cmpxchg.org> <alpine.DEB.2.11.1501231419420.11767@gentwo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.11.1501231419420.11767@gentwo.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Christoph Lameter <cl@linux.com>, Johannes Weiner <hannes@cmpxchg.org>
Cc: akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz
List-Id: linux-next.vger.kernel.org

On 01/23/2015 12:20 PM, Christoph Lameter wrote:
> On Fri, 23 Jan 2015, Johannes Weiner wrote:
>
>>          struct mem_cgroup_tree_per_node *rtpn;
>>          struct mem_cgroup_tree_per_zone *rtpz;
>> -       int tmp, node, zone;
>> +       int node, zone;
>>
>>          for_each_node(node) {
>
> Do for_each_online_node(node) {
>
> instead?
>

Wouldn't that have unintended consequences ? So far
rb tree nodes are allocated even if a node not online;
the above would change that. Are you saying it is
unnecessary to initialize rb tree nodes if the node
is not online ?

Not that I have any idea what is correct, it just seems odd
that the existing code would do all this allocation if it is not
necessary.

Guenter

