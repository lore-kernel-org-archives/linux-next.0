From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: next-20170217 boot on POWER8 LPAR : WARNING
 @kernel/jump_label.c:287
Date: Mon, 27 Feb 2017 10:22:43 -0500
Message-ID: <20170227102243.2172a8ea@gandalf.local.home>
References: <E6A8A7A8-6A55-4989-BAE9-39274876CA3C@linux.vnet.ibm.com>
 <1dffdaac-be8b-0052-52d4-a65fed39f894@akamai.com>
 <02B52EFB-4608-47F3-A81C-B8B52DB11233@linux.vnet.ibm.com>
 <20c53e88-acf5-4c4f-cea9-4dd8745814b5@akamai.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20c53e88-acf5-4c4f-cea9-4dd8745814b5@akamai.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Jason Baron <jbaron@akamai.com>
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 21 Feb 2017 11:37:21 -0500
Jason Baron <jbaron@akamai.com> wrote:


> Thanks for testing. We probably need something like the following to 
> make sure we don't hit this on other arches. Steve - I will send 4 
> separate patches for this to get arch maintainers' acks for this?
> 

I just got back from ELC, so sorry for the late reply.

I think you can just send this as one patch, as it is a single fix. Cc
each of the arch maintainers though. Unless you think it will have
conflicts with other changes in those archs. But I'm assuming there
wont be any conflicts.

This is a fix for something that I just pushed to Linus, thus it can
still get in after the merge window closes.

-- Steve
