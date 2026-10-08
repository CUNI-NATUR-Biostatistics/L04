# L04 generated images: provenance and prompts

This file records every AI-generated image used or proposed for the L04 presentation, as required by `_internal/.ai/authoring/presentation.md`. Each entry lists the target slide, teaching role, generation prompt, Czech alt text and status. Fill in the provenance fields (tool, date, file name, SHA-256) when an image is generated.

## Shared style rules

These rules follow the established course series (L01 animals, L02 penguins, L03 botanist):

- Warm storybook natural-history watercolour/gouache with gentle academic humour; animals or people behaving like careful field researchers.
- Brand palette as accents: graphite `#2E2E2E`, grey `#8A8A8A`, indigo `#5D2890`, amethyst `#86579E`, orange `#F3A712`, parchment `#F4F1EC`.
- Keep the deck's colour meaning inside the pictures: purple = model or interval objects; dark graphite = the reference; orange only as a small accent.
- No text, numbers, letters, logos, watermarks, charts or data claims in the image.
- Never place an image on a prediction or MCQ slide where it would reveal the answer.
- On the slide: Czech `fig-alt` and a small visible disclosure, „Ilustrace vytvořená pomocí AI.“ (`.text-size-tiny .text-right`, as in L01).
- The geyser photograph on slide 2 (NPS/Jim Peaco, public domain) stays unchanged.

## Existing image

### `geyser_observers_slopes.png` (not used in the polished deck)

- Status: generated 2026-09-16; removed from the deck on 2026-10-08 because it showed three different slopes before students predicted them (old slide „Tři pozorovatelé, tři odhady“). Kept as a possible reference for the title image.
- Generation mode: OpenAI built-in image generation; new bitmap asset.
- Brief: three geyser observers at separate stations, each holding a clipboard with a differently angled purple line; warm scientific watercolour/editorial style; 16:9; no instructional text, axes, formulas, logos or watermark.
- SHA-256: `552D30CCB747472482E301175239092D7B904316B49FA3948294A91DBA8F6476`

## Generated images (placed in the deck)

Slide numbers refer to the 45-slide deck of 2026-10-08. Ondřej Mottl added the images and asked for them to be incorporated (2026-10-08); the placements are recorded as a presentation story-map amendment.

### 1. Ring toss — slide 37 „95 % patří k postupu“ (recommended)

- Status: generated 2026-10-08; placed on slide 37 (left column, answer panels on the right), with alt text, visible AI disclosure and a speaker note explaining the metaphor.
- Teaching role: the classic picture of a confidence interval. The stake stays fixed (true slope), the thrown ring moves (interval), most throws ring the stake and a few miss. The slide follows the MCQ, so it does not reveal the answer.
- Suggested file: `geyser_ring_toss.png`
- Draft alt text: „Humorná ilustrace bizona, který hází fialové kroužky na tmavý kolík; většina kroužků kolík obepíná, dva leží vedle. Krkavec jako rozhodčí počítá oblázky. Ilustrace vytvořená pomocí AI.“
- Prompt:

```text
Use case: illustration-story / scientific-educational. Asset type: transparent painterly cutout for the left half of a 16:9 Czech university biostatistics slide, matching a course illustration series.
Scene: a cheerful American bison at a small rustic fairground ring-toss stall in Yellowstone, mid-throw, tossing purple rings at a single dark graphite wooden stake. Most purple rings already sit neatly around the stake; two rings lie on the ground beside it, clearly missed. A common raven referee sits on the stall post with a tiny wooden tally board of pebbles (no numbers), looking very official. Gentle humour: the bison concentrates intensely, tongue slightly out.
Teaching purpose: the stake never moves; each throw either rings it or misses; most throws succeed. Do not show any target with rings painted on it, any probability or percentage, or a chart.
Style: warm storybook natural-history watercolour/gouache, soft painted fur and feather textures, natural animal anatomy, clean silhouettes.
Palette: natural browns for the bison; rings indigo #5D2890 / amethyst #86579E; stake graphite #2E2E2E; parchment #F4F1EC stall wood; a single restrained orange #F3A712 accent (e.g., a pennant). Must read clearly on a parchment #F4F1EC slide background.
Composition: compact, roughly square, all figures fully inside the frame with transparent padding; readable at about 500 px display width.
Text: none. NO TEXT, NO NUMBERS, NO LETTERS, NO logos, NO watermark. True transparent background, clean alpha edges, no baked rectangle or scenery backdrop.
```

### 2. Nobody watches at night — slide 43 „Co ještě omezuje náš závěr?“ (recommended)

- Status: generated 2026-10-08; placed on slide 43 (right column), with alt text and visible AI disclosure.
- Teaching role: makes the sampling limitation concrete. Volunteers record only when present, so the data are not a random sample of all eruptions.
- Suggested file: `geyser_night_eruption.png`
- Draft alt text: „Humorná ilustrace nočního výbuchu gejzíru Old Faithful: bizon a svišť na lavičce spí, stopky a prázdný zápisník jim padají z tlap a erupci sleduje jen výr. Ilustrace vytvořená pomocí AI.“
- Prompt:

```text
Use case: illustration-story / scientific-educational. Asset type: painted illustration for the right half of a 16:9 Czech university biostatistics slide, matching a course illustration series.
Scene: Old Faithful erupting under a moonlit night sky. On the boardwalk bench in the foreground, two volunteer observers (a bison in a knitted hat and a yellow-bellied marmot wrapped in a blanket) are fast asleep, a stopwatch and an open notebook with empty lines slipping from their paws. Only a wide-eyed great horned owl on the railing is watching the eruption. Gentle humour; no one is to blame.
Teaching purpose: some eruptions are never recorded, so the recorded eruptions are not a perfectly random sample of all eruptions.
Style: warm storybook natural-history watercolour/gouache, soft night palette, natural animal anatomy; the geyser is a stylised plume, not a copy of the NPS photograph.
Palette: night sky in deep indigo #5D2890 and amethyst #86579E; graphite #2E2E2E silhouettes; parchment #F4F1EC steam highlights; one small orange #F3A712 accent (the stopwatch or a lantern).
Composition: landscape about 4:3, focal sleepers in the lower foreground, owl clearly visible, eruption behind.
Text: none. NO TEXT, NO NUMBERS, NO LETTERS, NO clock digits, NO logos, NO watermark.
```

### 3. Team photo of Pepa, Mařenka and Karel — slide 14 „Co čekáte od Mařenky a Karla?“ (recommended)

- Status: generated 2026-10-08; placed on slide 14 beside the discussion panel, with alt text and visible AI disclosure.
- Teaching role: gives the three month-observers memorable faces. The clipboards show only dots, never lines, so the prediction stays open.
- Suggested file: `geyser_team_photo.png`
- Draft alt text: „Humorná ilustrace tří terénních výzkumníků z Yellowstonu — bizona Pepy, svištice Mařenky a krkavce Karla — z nichž každý drží vlastní desky s několika šedými body. Ilustrace vytvořená pomocí AI.“
- Prompt:

```text
Use case: illustration-story / scientific-educational. Asset type: transparent painterly cutout for the right half of a 16:9 Czech university biostatistics slide, matching a course illustration series.
Scene: a cheerful "team photo" of three Yellowstone field researchers standing side by side on a boardwalk: an American bison (June: straw sun hat, short sleeves), a yellow-bellied marmot (July: sunglasses, holding an ice-cream-coloured water bottle) and a common raven (August: tiny rain poncho, a few raindrops). Each proudly holds up their own clipboard showing only a small scatter of grey dots, every clipboard with a slightly different arrangement of dots. Gentle humour: they pose like a serious science team.
Teaching purpose: three observers in three different months, each with their own set of observations. Do NOT draw any line, trend, arrow or number on the clipboards.
Style: warm storybook natural-history watercolour/gouache, natural anatomy, clean silhouettes, matching the series' penguin researchers.
Palette: natural fur/feather colours, graphite #2E2E2E; clipboards parchment #F4F1EC with grey #8A8A8A dots; small accessories in amethyst #86579E and indigo #5D2890; one restrained orange #F3A712 accent.
Composition: compact horizontal group, all three fully visible with transparent padding; readable at about 600 px width.
Text: none. NO TEXT, NO NUMBERS, NO LETTERS, NO month names, NO logos, NO watermark. True transparent background, no scenery rectangle.
```

### 4. Crowd sending reports to GeyserWatch — slide 18 „Co udělá sto dalších pozorovatelů?“ (optional)

- Status: generated 2026-10-08; placed on slide 18 (right column; the sketch prompt moved into the left column and the simulation panel was shortened so the slide fits).
- Teaching role: makes the many-independent-reports idea vivid. The slide already carries text, so it needs a lighter layout.
- Suggested file: `geyserwatch_crowd.png`
- Draft alt text: „Humorná ilustrace zástupu návštěvníků a zvířat na chodníku u gejzíru; od každého letí papírová vlaštovka do velkého telefonu s ikonou gejzíru. Ilustrace vytvořená pomocí AI.“
- Prompt:

```text
Use case: illustration-story / scientific-educational. Asset type: transparent painterly cutout for one column of a 16:9 Czech university biostatistics slide, matching a course illustration series.
Scene: a long, cheerful crowd of tiny Yellowstone visitors (hikers, a family, a bison, a marmot, an elk, a raven) along a boardwalk, each holding up a stopwatch or a little notebook. From every observer a small paper airplane flies upward and converges into one large friendly smartphone whose screen shows only a simple stylised geyser icon on indigo. Gentle humour: the airplanes form a busy, orderly stream.
Teaching purpose: many independent observers each send their own report. Do NOT show any chart, histogram, bars, line or number on the phone or anywhere else.
Style: warm storybook natural-history watercolour/gouache, small but readable figures, clean silhouettes.
Palette: phone screen indigo #5D2890 with amethyst #86579E; paper airplanes parchment #F4F1EC; figures in natural colours with graphite #2E2E2E outlines; one restrained orange #F3A712 accent.
Composition: diagonal flow from the crowd (lower left) to the phone (upper right), all elements inside the frame with transparent padding.
Text: none. NO TEXT, NO NUMBERS, NO LETTERS, NO app name, NO logos, NO watermark. True transparent background.
```

## Title image

- Status: generated 2026-10-08 at the explicit request of Ondřej Mottl to create the title picture from the four newly generated lesson illustrations. This request supersedes the earlier decision to postpone generation. Visually checked; embedded on the title slide with the shared `.course-title-illustrated` layout, Czech alt text, the visible caption „Ilustrace vytvořená pomocí AI.“ and a speaker note.
- File: `geyser_titulni_ilustrace.png` (1122 x 1402 px, RGBA PNG with true transparency).
- Generation mode: OpenAI built-in image generation; new composition with four local reference images supplied in the order below.
- Reference 1: `geyser_ring_toss.png` (section 1): painterly fur and feathers, rustic wood and purple ring motif.
- Reference 2: `geyser_night_eruption.png` (section 2): Old Faithful plume and great horned owl.
- Reference 3: `geyser_team_photo.png` (section 3): primary character and clothing reference for the bison, marmot and raven research team.
- Reference 4: `geyserwatch_crowd.png` (section 4): observation equipment, paper airplanes and smartphone with a geyser icon.
- Reference provenance: all four are course-generated AI illustrations created on 2026-10-08; their original prompts and SHA-256 hashes are recorded in this file. All four actual reference images were inspected before generation. No third-party photographs, data plots or logos were supplied.
- Reuse terms: see the repository's educational-content terms in [LICENSE.md](../../LICENSE.md); retain the AI disclosure and reference provenance when reusing this illustration.
- Teaching role: introduces the lesson's Old Faithful observation story and recurring field-research characters without adding numerical results or revealing the ring-toss outcome.
- Draft alt text: „Bizon ve slaměném klobouku, svišť v brýlích a krkavec ve fialové pláštěnce pozorují gejzír Old Faithful; drží desky s šedými body a stopky. Na zábradlí sedí výr, vedle telefonu s ikonou gejzíru letí papírové vlaštovky a visí fialové kroužky. Ilustrace vytvořená pomocí AI.“
- SHA-256: `B1E2B5DC4F05CA023A761D56C98D4F4D9D715CD949EE0E7DB5D1CAC6E54CDB4D`
- Final prompt:

```text
Use case: illustration-story / scientific-educational.
Asset type: one new transparent painterly title-slide illustration for L04, a Czech university biostatistics lesson about Old Faithful, observational estimates and uncertainty. It will sit beside editable title text on the right-hand 36% of a deep indigo slide.
Input images are visual REFERENCES, not separate panels or an edit target: Image 1 ring toss (fur, feathers, rustic wood, purple rings); Image 2 night eruption (recognisable stylised Old Faithful steam plume and great horned owl); Image 3 team portrait (PRIMARY reference for the exact familiar bison, marmot and raven characters and their clothing); Image 4 GeyserWatch crowd (paper airplanes, smartphone geyser icon and observation equipment). Create a coherent new scene from these references, not a pasted collage. Preserve their warm natural-history watercolour/gouache brushwork and character identities.
Scene: the same cheerful American bison in a straw hat and short-sleeved field shirt, yellow-bellied marmot with sunglasses, and common raven in a small purple rain poncho are working together on a compact Yellowstone boardwalk. Bison and marmot hold small parchment clipboards with a few scattered neutral grey observation dots; raven proudly presents an orange-accented analog stopwatch WITHOUT numerals. Behind them, Old Faithful sends a tall luminous parchment-white plume upward. A small great horned owl watches quietly from a railing. Nearby a modest smartphone shows ONLY the stylised white geyser icon on indigo; a few small parchment paper airplanes float toward it. One or two purple ring-toss rings hang unused from a railing hook as a subtle reference, with no stake target and no successful/missed-throw demonstration. Gentle academic humour, serious little researchers, natural animal anatomy.
Composition: compact, vertically balanced portrait cutout, roughly 4:5 aspect ratio. Geyser plume in the upper half, main trio dominant in the lower half, secondary props small and uncluttered. All subjects, feet, wings, props and plume fully within the frame, with generous clear transparent padding on every side. Readable when displayed about 450 pixels wide. One continuous scene, no panel borders. The title/question/logo will be added separately in the slide source; leave them out of the image.
Palette: natural brown fur and graphite #2E2E2E feathers; parchment #F4F1EC paper, steam and pale wood; indigo #5D2890 and amethyst #86579E accessories and rings; restrained orange #F3A712 stopwatch accent. Light silhouettes and steam must remain visible on deep indigo.
Constraints: genuinely transparent background with clean alpha edges; NO sky rectangle, gradient backdrop, painted background halo, or opaque paper texture outside the subjects. NO text, NO numbers, NO letters, NO equations, NO axes, NO trend lines, NO statistical charts, NO percentage symbols, NO clock digits, NO labels, NO logos, NO watermarks. Do not invent numerical results or illustrate an answer to a prediction question.
```

## Generation provenance

All four assets were generated with OpenAI built-in image generation from the exact prompts above, without reference images. The original prompts and draft Czech alt texts are retained unchanged. Ring toss, team photo and crowd are RGBA PNG cutouts with verified transparent pixels; the night eruption is an opaque RGB PNG. Visual inspection checked the subjects, requested teaching roles and absence of instructional text, numbers, trend lines or charts. All five images are now placed; rendered alt text and the visible AI disclosure were checked in the static PDF on 2026-10-08.

| File | Tool and date | Prompt section | SHA-256 | Placed on slide | Alt text and disclosure checked |
|---|---|---|---|---|---|
| `geyser_ring_toss.png` | OpenAI built-in image generation, 2026-10-08 | 1. Ring toss | `58B5264F8D995B6B8C410F644296C56C7513554C5C57957330E1D49810F31618` | Slide 37 | Yes (2026-10-08) |
| `geyser_night_eruption.png` | OpenAI built-in image generation, 2026-10-08 | 2. Nobody watches at night | `37931CE83B470AAC6562599BBCB1E4763B11572ACE14D1BFD650CC05C96E6782` | Slide 43 | Yes (2026-10-08) |
| `geyser_team_photo.png` | OpenAI built-in image generation, 2026-10-08 | 3. Team photo | `7D00880A60C414E8D2A7D119B04308254BD84F49B4404CEB7F05970496995B10` | Slide 14 | Yes (2026-10-08) |
| `geyserwatch_crowd.png` | OpenAI built-in image generation, 2026-10-08 | 4. Crowd sending reports | `1243B7A7A1FA0CAEB07AF17A9F1722ED4E46C29367B8F70D4F01D8C25DC6104F` | Slide 18 | Yes (2026-10-08) |
| `geyser_titulni_ilustrace.png` | OpenAI built-in image generation, 2026-10-08 | Title image | `B1E2B5DC4F05CA023A761D56C98D4F4D9D715CD949EE0E7DB5D1CAC6E54CDB4D` | Slide 1 (title) | Yes (2026-10-08) |
