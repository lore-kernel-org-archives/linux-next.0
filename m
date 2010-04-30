From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: -next Apr 30: OOPS during eHEA driver initialization
Date: Fri, 30 Apr 2010 11:35:13 -0600
Message-ID: <n2kfa686aa41004301035p7e15c017u7a1b98389cc1e466@mail.gmail.com>
References: <4BDAF376.4030005@in.ibm.com> <4BDB12FB.5060806@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <4BDB12FB.5060806@in.ibm.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Linux/PPC Development <linuxppc-dev@ozlabs.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 30, 2010 at 11:27 AM, Sachin Sant <sachinp@in.ibm.com> wrote:
> Sachin Sant wrote:
>>
>> With today's next eHEA drivers fails to initialize.
>
> If i revert the following patch eHEA network interface is initialized
> properly.
>
> commit cebfe0b6709abdab997c1a00499d67efa32ee1f0
> drivercore: Add of_match_table to the common device drivers

That is an easy one to fix.  I'll get it updated today and send you the result.

g.
