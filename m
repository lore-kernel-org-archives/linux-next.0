From: roel kluin <roel.kluin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: linux-next: tree build failure
Date: Tue, 29 Sep 2009 11:51:56 +0200
Message-ID: <25e057c00909290251h55c0dc25o4ab1f2e84c920dca@mail.gmail.com>
References: <4AC1E15502000078000516B5@vpn.id2.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4AC1E15502000078000516B5-Qfbpwmsw6RoS3W1tAdPHOtBPR1lH4CV8@public.gmane.org>
Sender: kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Beulich <jbeulich-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>
Cc: sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Tue, Sep 29, 2009 at 11:28 AM, Jan Beulich <jbeulich-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org> wro=
te:
>>>> Hollis Blanchard =A009/29/09 2:00 AM >>>
>>First, I think there is a real bug here, and the code should read lik=
e
>>this (to match the comment):
>> =A0 =A0/* type has to be known at build time for optimization */
>>- =A0 =A0BUILD_BUG_ON(__builtin_constant_p(type));
>>+ =A0 =A0BUILD_BUG_ON(!__builtin_constant_p(type));
>>
>>However, I get the same build error *both* ways, i.e.
>>__builtin_constant_p(type) evaluates to both 0 and 1? Either that, or
>>the new BUILD_BUG_ON() macro isn't working...
>
> No, at this point of the compilation process it's neither zero nor on=
e,
> it's simply considered non-constant by the compiler at that stage
> (this builtin is used for optimization, not during parsing, and the
> error gets generated when the body of the function gets parsed,
> not when code gets generated from it).
>
> Jan

then maybe

if(__builtin_constant_p(type))
        BUILD_BUG_ON(1);

would work?

Roel
--
To unsubscribe from this list: send the line "unsubscribe kvm-ppc" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
