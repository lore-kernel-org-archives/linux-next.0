From: Christoph Lameter <cl@linux.com>
Subject: Re: mmotm 2015-01-22-15-04: qemu failure due to 'mm: memcontrol:
 remove unnecessary soft limit tree node test'
Date: Fri, 23 Jan 2015 15:09:20 -0600 (CST)
Message-ID: <alpine.DEB.2.11.1501231508020.7871@gentwo.org>
References: <54c1822d.RtdGfWPekQVAw8Ly%akpm@linux-foundation.org> <20150123050802.GB22751@roeck-us.net> <20150123141817.GA22926@phnom.home.cmpxchg.org> <alpine.DEB.2.11.1501231419420.11767@gentwo.org> <54C2B01D.4070303@roeck-us.net>
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <54C2B01D.4070303@roeck-us.net>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Johannes Weiner <hannes@cmpxchg.org>, akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz
List-Id: linux-next.vger.kernel.org

On Fri, 23 Jan 2015, Guenter Roeck wrote:

> Wouldn't that have unintended consequences ? So far
> rb tree nodes are allocated even if a node not online;
> the above would change that. Are you saying it is
> unnecessary to initialize rb tree nodes if the node
> is not online ?

It is not advisable to allocate since an offline node means that the
structure cannot be allocated on the node where it would be most
beneficial. Typically subsystems allocate the per node data structures
when the node is brought online.

> Not that I have any idea what is correct, it just seems odd
> that the existing code would do all this allocation if it is not
> necessary.

Not sure how the code there works just guessing from other subsystems.

