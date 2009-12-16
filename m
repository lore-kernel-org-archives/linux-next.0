From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: [Next] CPU Hotplug test failures on powerpc
Date: Wed, 16 Dec 2009 12:11:53 +0530
Message-ID: <4B288131.2050306@in.ibm.com>
References: <4B2224C7.1020908@in.ibm.com>
	<7b6bb4a50912152225p4f5dde13re83c439407c16eaf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <7b6bb4a50912152225p4f5dde13re83c439407c16eaf@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Xiaotian Feng <xtfeng@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>
List-Id: linux-next.vger.kernel.org

Xiaotian Feng wrote:
> Does this testcase hotplug cpu 0 off?
>   
No, i don't think so. It skips cpu0 during online/offline
process.

thanks
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
