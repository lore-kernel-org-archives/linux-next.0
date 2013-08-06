From: Sedat Dilek <sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: linux-next: Tree for Aug 6 [ wireless | iwlwifi | mac80211 ? ]
Date: Tue, 6 Aug 2013 16:59:12 +0200
Message-ID: <CA+icZUXrRsXfeW9hqxTMkKW4TdNSBH-zE8-zX2Rd7HTAx5MvqQ@mail.gmail.com>
References: <CA+icZUX8OcTSOABO6Nbz5R6_5-m39rsYOpDqYBA7hf8LFvJLLA@mail.gmail.com>
	<1375797260.8219.21.camel@jlt4.sipsolutions.net>
	<CA+icZUUAJ25QybqHvxz7eubSLH6YuNjcc5zyU2O5Xi9vevMGkw@mail.gmail.com>
	<1375800617.8219.23.camel@jlt4.sipsolutions.net>
	<CA+icZUVbKpyuke6PRg3-60gOggsTb=3cNRz3Sy0RmvcZSuPaNw@mail.gmail.com>
	<1375801059.8219.24.camel@jlt4.sipsolutions.net>
Reply-To: sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375801059.8219.24.camel-8Nb76shvtaUJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 6, 2013 at 4:57 PM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
> On Tue, 2013-08-06 at 16:56 +0200, Sedat Dilek wrote:
>> On Tue, Aug 6, 2013 at 4:50 PM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
>> > On Tue, 2013-08-06 at 16:46 +0200, Sedat Dilek wrote:
>> >
>> > Heh, the interesting messages are always cut out of the log:
>> >
>> > Aug  6 16:30:34 fambox wpa_supplicant[2533]: wlan0: WPA: RX message 1 of 4-Way Handshake from 00:04:0e:e4:00:3d (ver=2)
>> > Aug  6 16:30:34 fambox wpa_supplicant[2533]: RSN: msg 1/4 key data - hexdump(len=0):
>> > Aug  6 16:30:34 fambox wpa_supplicant[2533]: Get randomness: len=32 entropy=4
>> > Aug  6 16:30:34 fambox wpa_supplicant[2533]: random from os_get_random - hexdump(len=32): [REMOVED]
>> > Aug  6 16:30:34 fambox wpa_supplicant[2533]: random_mix_pool - hexdump(len=20): [REMOVED]
>> > Aug  6 16:30:34 fambox wpa_supplicant[2533]: random from internal pool - hexdump(len=16): [REMOVED]
>> > Aug  6 16:30:34 fambox wpa_supplicant[2533]: random_mix_pool - hexdump(len=20): [REMOVED]
>> > Aug  6 16:30:34 fambox rsyslogd-2177: imuxsock begins to drop messages from pid 2533 due to rate-limiting
>> > [...]
>> >
>>
>> Do you know how I can workaround the rsyslogd rate-limiting?
>
> Me? no.
>

Hmmm, I thought about reducing from -ddd to -d or install a newer rsyslog.

- Sedat -

> johannes
>
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
