From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2018-03-07-16-19 uploaded (UML & memcg)
Date: Wed, 7 Mar 2018 18:23:01 -0800
Message-ID: <d6ec23eb-a886-9fef-99c7-51c7ba4f5d18@infradead.org>
References: <20180308002016.L3JwBaNZ9%akpm@linux-foundation.org>
 <41ec9eeb-f0bf-e26d-e3ae-4a684c314360@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <41ec9eeb-f0bf-e26d-e3ae-4a684c314360@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz, mm-commits@vger.kernel.org, sfr@canb.auug.org.au, Shakeel Butt <shakeelb@google.com>
List-Id: linux-next.vger.kernel.org

On 03/07/2018 06:20 PM, Randy Dunlap wrote:
> On 03/07/2018 04:20 PM, akpm@linux-foundation.org wrote:
>> The mm-of-the-moment snapshot 2018-03-07-16-19 has been uploaded to
>>
>>    http://www.ozlabs.org/~akpm/mmotm/
>>
>> mmotm-readme.txt says
>>
>> README for mm-of-the-moment:
>>
>> http://www.ozlabs.org/~akpm/mmotm/
>>
>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>> more than once a week.
> 
> UML on i386 and/or x86_64:
> 
> defconfig, CONFIG_MEMCG is not set:
> 
> ../fs/notify/group.c: In function 'fsnotify_final_destroy_group':
> ../fs/notify/group.c:41:24: error: dereferencing pointer to incomplete type
>    css_put(&group->memcg->css);
>                         ^
> 
> From: Shakeel Butt <shakeelb@google.com>
> Subject: fs: fsnotify: account fsnotify metadata to kmemcg



or x86 any time that CONFIG_MEMCG is not enabled.


-- 
~Randy
