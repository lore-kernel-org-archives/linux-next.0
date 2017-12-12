From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke-LJ9M9ZcSy1A@public.gmane.org>
Subject: Re: linux-next: build failure after merge of the mac80211-next tree
Date: Tue, 12 Dec 2017 09:59:45 +0100
Message-ID: <87r2s0uxry.fsf@toke.dk>
References: <20171212125805.5f7813fd@canb.auug.org.au> <1513068419.26976.86.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513068419.26976.86.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Linux-Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Networking <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> writes:

> Hi Stephen,
>
> Thanks!
>
> Felix made me aware of this yesterday evening and said he's going to
> work out the required changes to mt76.
>
> Kalle and I will make sure to submit the trees to Dave one by one so he
> doesn't have to deal with it :)
>
> Unfortunately, this might take a few days to resolve.
>
>> -void mt76_wake_tx_queue(struct ieee80211_hw *hw, struct ieee80211_txq *txq)
>> +void mt76_wake_tx_queue(struct ieee80211_hw *hw)
>>  {
>> +	struct ieee80211_txq *txq;
>>  	struct mt76_dev *dev = hw->priv;
>> -	struct mt76_txq *mtxq = (struct mt76_txq *) txq->drv_priv;
>> -	struct mt76_queue *hwq = mtxq->hwq;
>> +	struct mt76_txq *mtxq;
>> +	struct mt76_queue *hwq;
>>  
>> +	txq = ieee80211_next_txq(hw);
>> +	mtxq = (struct mt76_txq *) txq->drv_priv;
>> +	hwq = mtxq->hwq;
>
> Looks pretty much right to me - perhaps for safety there should be a
> NULL check on txq, but OTOH when you get here it should be non-NULL.

Note that while this will fix compilation it probably won't work right.
next_txq() is not guaranteed to return the same txq as was previously
passed in the wake_tx_queue() argument, so if this is the only place the
driver calls next_txq(), things are likely going to break.

Rather, the driver should call next_txq() whenever it schedules queues
instead of doing its own internal scheduling.

> Sorry for the inconvenience, I hadn't realized mt76 went in now.

Yeah, hadn't expected these streams to cross either. If Felix is looking
into this that is great; let me know if you need me to do anything else
on the mac80211 side. :)

-Toke
