From: Joe Stringer <joestringer@nicira.com>
Subject: Re: randconfig build error with next-20150911, in net/openvswitch
Date: Fri, 11 Sep 2015 15:05:09 -0700
Message-ID: <CANr6G5zD=Pkt=ZvFW8i8AXX_0KnwxZviOCuFVR8Z90Zzf9SY6A@mail.gmail.com>
References: <CA+r1Zhiv+XTVX2a-E-57dDkxqvNNVMf7NpoBVuabXBZsPXT_4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yk0-f174.google.com ([209.85.160.174]:33774 "EHLO
	mail-yk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752934AbbIKWF3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Sep 2015 18:05:29 -0400
Received: by ykei199 with SMTP id i199so105227052yke.0
        for <linux-next@vger.kernel.org>; Fri, 11 Sep 2015 15:05:28 -0700 (PDT)
In-Reply-To: <CA+r1Zhiv+XTVX2a-E-57dDkxqvNNVMf7NpoBVuabXBZsPXT_4g@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Pravin Shelar <pshelar@nicira.com>, netdev <netdev@vger.kernel.org>, "dev@openvswitch.org" <dev@openvswitch.org>, "David S. Miller" <davem@davemloft.net>

On 11 September 2015 at 09:53, Jim Davis <jim.epost@gmail.com> wrote:
> Building with the attached random configuration file,
>
> net/built-in.o: In function `ovs_ct_execute':
> (.text+0x10f587): undefined reference to `nf_ct_frag6_gather'

Thanks for the report, I sent a patch:
https://patchwork.ozlabs.org/patch/517033/
