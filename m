From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the final tree
	(devicetree tree related)
Date: Tue, 18 May 2010 16:16:30 -0600
Message-ID: <AANLkTik0G8QXBrqbJXwylJOE1QoSzGe4yixUrTenYtdO@mail.gmail.com>
References: <20100518174750.cc965d84.sfr@canb.auug.org.au>
	<AANLkTil4MIKUrzK-SOS9satdcL34F5B_3D6ddFn6lThL@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:49723 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755274Ab0ERWQw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 May 2010 18:16:52 -0400
In-Reply-To: <AANLkTil4MIKUrzK-SOS9satdcL34F5B_3D6ddFn6lThL@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 18, 2010 at 5:52 AM, Grant Likely <grant.likely@secretlab.c=
a> wrote:
> On Tue, May 18, 2010 at 1:47 AM, Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>> Hi Grant,
>>
>> After merging the final tree, yesterday's linux-next build (powerpc
>> mpc85xx_defconfig) failed like this:
>>
>> http://kisskb.ellerman.id.au/kisskb/buildresult/2615202/
>>
>> I suspect that is something to do with the devicetree tree.
>
> Ah, yes. =A0I'll push out fixes for those this morning.

=46ixed tree pushed out.

g.
